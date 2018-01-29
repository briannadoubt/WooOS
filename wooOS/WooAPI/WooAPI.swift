//
//  WooAPI.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class WooAPI {
    
    //  ------------------------
    /// MARK: - Static Variables
    //  ------------------------
    
    /// Current version of the WooCommerce REST API. Used to concatenate the url path.
    public static let version = "wp-json/wc/v2/"
    
    /// The slug used to obtain the token with a valid username and password.
    public static let tokenSlug = "jwt-auth/v1/token"
    
    /// The slug used to validate an existing token.
    public static let validateTokenSlug = "jwt-auth/v1/token/validate"
    
    //  -----------------------------------------------------------
    /// MARK: - Private constants, variables and factory functions.
    //  -----------------------------------------------------------
    
    /// The consumer key found in the WooCommerce API settings.
    public var consumerKey: String
    
    /// The consumer secret found in the WooCommerce API settings.
    public var consumerSecret: String
    
    /// The baseURL for all the requests. A WooCommerce instance should be installed on the server this URL is pointing to.
    public var siteURL: URL
    
    /// The stored token used to validate the user's authentication session.
    public var token: String? {
        get { return UserDefaults.standard.string(forKey: "token") }
        set { UserDefaults.standard.set(newValue, forKey: "token") }
    }
    
    /// The shared SessionManager instance for Alamofire.
    private let alamofireManager: SessionManager = {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: sessionConfiguration)
    }()
    
    /// Generates the HTTP headers with the stored auth token.
    ///
    /// - Parameter token: The stored token to be embedded in the HTTP header
    /// - Returns: ["Authorization" : "Bearer \(token ?? "")"]
    private func authHeaders(with token: String?) -> [String: String]? {
        if token == nil {
            return nil
        }
        let authHeaders = ["Authorizaion" : "Bearer \(token ?? "")"]
        return authHeaders
    }
    
    /// Generates the URL parameters needed for authenticating with WooCommerce with the Basic authentication method.
    ///
    /// - Returns: ["consumer_key" : {STORED CONSUMER KEY}, "consumer_secret" : {STORED CONSUMER SECRET}] with the type [String: String]
    private func authURLParameters() -> [String: String] {
        let params = ["consumer_key" : consumerKey,
                      "consumer_secret" : consumerSecret]
        return params
    }
    
    //  ----------------------
    /// MARK: - Initialization
    //  ----------------------
    
    /// Initializer used to instantiate the main shared instance.
    ///
    /// - Parameters:
    ///   - url: The base site URL of the WooCommerce store.
    ///   - key: The Consumer Key found in the WooCommerce API settings.
    ///   - secret: The Consumer Secret found in the WooCommerce API settings.
    init(url: URL, key: String, secret: String) {
        self.siteURL = url
        self.consumerKey = key
        self.consumerSecret = secret
    }
    
    //  ----------------
    /// MARK: - Requests
    //  ----------------
    
    // TODO: Create Object, Update Object
    
    /// Get a single Mappable object by ID
    ///
    /// - Parameters:
    ///   - type: The type of object being requested, with associated slug.
    ///   - id: The unique ID of the object being requested.
    ///   - complete: Asynchronous callback containing a success flag, the object that was requested, and an error string if failed. If unsuccessful: success = false, object = nil, error = String.
    public func getObject<T: Mappable>(type request: WooRequestType, then complete: @escaping WooCompletion.Object<T>) {
        
        let path = WooAPI.version + request.slug
        guard let requestURL = URL(string: path, relativeTo: siteURL) else {
            complete(false, nil, "Cannot construct URL for GETting a single object.")
            return
        }
        let credentialsParameters = ["username": consumerKey, "password": consumerSecret]
        
        alamofireManager.request(requestURL, method: .get, parameters: credentialsParameters)
            .responseJSON { response in
                guard
                    response.result.isSuccess,
                    let json = response.result.value as? [String:Any] else {
                        complete(false, nil, "Could not parse JSON into [String : Any]")
                        return
                }
                let object = Mapper<T>().map(JSON: json)
                complete(true, object, nil)
        }
    }
    
    /// Get a list of Mappable Objects
    ///
    /// - Parameters:
    ///   - type: The type of objects being requested.
    ///   - parameters: The parameters required for requesting objects.
    ///   - complete: Asynchronous callback containing a success flag, the object that was requested, and an error string if failed. If unsuccessful: success = false, unsafeList = nil, unsafeError = String.
    public func getList<T: Mappable>(with parameters: WooRequestParameters.Array,
                                     then complete: @escaping WooCompletion.Array<T>)
    {
        let path = WooAPI.version + parameters.type.slug
        guard let requestURL = URL(string: path, relativeTo: siteURL) else {
            complete(false, nil, "Get List request URL could not be constructed with slug relative to base URL.")
            return
        }
        
        alamofireManager.request(requestURL,
                                 method: .get,
                                 parameters: authURLParameters(),
                                 encoding: URLEncoding.default,
                                 headers: authHeaders(with: token))
            .responseJSON { dataResponse in
                
//                print(dataResponse.error as Any)
//                print(dataResponse.response?.url as Any)
//                print(dataResponse.value as Any)
                
                guard dataResponse.result.isSuccess else {
                    complete(false, nil, "Response returned unsuccessful")
                    return
                }
                
                guard let json = dataResponse.result.value as? [[String : Any]] else {
                    complete(false, nil, "JSON error: could not parse into array of dictionaries.")
                    return
                }
                
                let objects = Mapper<T>().mapArray(JSONArray: json)
                
                complete(true, objects, nil)
        }
    }
    
    //  ----------------------
    /// MARK: - Authentication
    //  ----------------------
    
    /// Login user with supplied username and password.
    ///
    /// - Parameters:
    ///   - username: String of Username provided by User.
    ///   - password: String of Password provided by User.
    ///   - complete: Asynchronous callback containing a success flag and an error string if failed. If unsuccessful: success = false, error = String.
    public func login(with username: String,
                      and password: String,
                      then complete: @escaping (_ success: Bool, _ error: String?)->()) {
        getToken(with: username, and: password) { success, unsafeToken, e in
            guard let safeToken = unsafeToken else {
                complete(false, e)
                return
            }
            print("Logged in with token:", safeToken)
            self.token = safeToken
            complete(success, nil)
        }
    }
    
    /// Log user out by revoking the token on the server, deleting the token locally, and deleting the stored username.
    public func logout() {
        self.token = nil
        WooOS.main.username = nil
    }
    
    /// Get a new token with the provided Username and Password of end user. Username and Password is usually obtained from the UI.
    ///
    /// - Parameters:
    ///   - username: String of Username provided by User.
    ///   - password: String of Password provided by User.
    ///   - complete: Asynchronous callback containing a success flag, the token that was requested, and an error string if failed. If unsuccessful: success = false, token = nil, error = String.
    private func getToken(with username: String,
                          and password: String,
                          then complete: @escaping WooCompletion.Token) {
        WooOS.main.username = username
        
        self.alamofireManager.request("https://eightfold.yoga/wp-json/jwt-auth/v1/token",
                                      method: .post,
                                      parameters: ["username": username, "password": password])
            .responseJSON { response in
                
                print(response.value as Any)
                
                guard
                    response.result.isSuccess,
                    let json = response.result.value as? [String:Any],
                    let newToken = json["token"] as? String
                    else {
                        complete(false, nil, "Failed to get token")
                        return
                }
                self.token = newToken
                complete(true, newToken, nil)
        }
    }
    
    /// Validate the currently
    ///
    /// - Parameter complete: Completion to confirm whether or not the token was validated successfully.
    private func validateToken(then complete: @escaping (_ success: Bool) -> ()) {
        guard let token = self.token else {
            complete(false)
            return
        }
        self.alamofireManager.request("https://eightfold.yoga/wp-json/jwt-auth/v1/token/validate",
                                      method: .post,
                                      headers: authHeaders(with: token))
            .responseJSON { response in
                guard
                    response.result.isSuccess,
                    let json = response.result.value as? [String:Any],
                    let data = json["data"] as? [String : Any],
                    let status = data["status"] as? Int
                    else {
                        complete(false)
                        return
                }
                if status == 200 {
                    complete(true)
                } else {
                    complete(false)
                }
        }
    }
}
