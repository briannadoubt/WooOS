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

/// This class is the handler for WooCommerce REST API calls and session handling.
public class WooAPI {
    
    //  ------------------------
    /// MARK: - Static Variables
    //  ------------------------
    
    /// Current version of the WooCommerce REST API. Used to concatenate the url path.
    static let version = "wp-json/wc/v2"
    
    /// The slug used to obtain the token with a valid username and password.
    static let tokenSlug = "jwt-auth/v1/token"
    
    /// The slug used to validate an existing token.
    static let validateTokenSlug = "jwt-auth/v1/token/validate"
    
    /// The service used to identify data being saved from this app.
    static let keychainService = "WooOS"
    
    //  -----------------------------------------------------------
    /// MARK: - Private constants, variables and factory functions.
    //  -----------------------------------------------------------
    
    /// The consumer key found in the WooCommerce API settings.
    var consumerKey: String?
    
    /// The consumer secret found in the WooCommerce API settings.
    var consumerSecret: String?
    
    /// The baseURL for all the requests. A WooCommerce instance should be installed on the server this URL is pointing to.
    var siteURL: URL
    
    /// The stored token used to validate the user's authentication session, stored in the UserDefaults dictionary, accessed with the getter and setter on this variable.

    
    /// The shared SessionManager instance for Alamofire.
    let alamofireManager: SessionManager = {
        
        // Build the session manager with the configured session.
        let manager = Alamofire.SessionManager(configuration: .default)
        
        return manager
    }()
    
    //  ----------------------
    /// MARK: - Initialization
    //  ----------------------
    
    /// Initializer used to instantiate the main shared instance.
    ///
    /// - Parameters:
    ///   - url: The base site URL of the WooCommerce store.
    init(url: URL) {
        self.siteURL = url
    }
    
    /// Initializer used to instantiate the main shared instance with manager priviledges.
    ///
    /// - Parameters:
    ///   - url: The base site URL of the WooCommerce store.
    ///   - key: The Consumer Key found in the WooCommerce API settings.
    ///   - secret: The Consumer Secret found in the WooCommerce API settings.
    init(url: URL, key: String?, secret: String?) {
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
    func getObject<T: Mappable>(type request: WooRequestConvertible, then complete: WooCompletion.Object<T>? = nil) {
        
        // Get manager credentials if they exist
        let credentials = (try? managerURLCredential()) ?? URLCredential()
        
        // Perform request
        alamofireManager.request(request)
            // Authenticate using given credentials
            .authenticate(usingCredential: credentials)
            // Handle response from request
            .responseJSON { jsonResponse in
                
                print(jsonResponse.value as Any)
                
                guard
                    // Assure response is success
                    jsonResponse.result.isSuccess,
                    
                    // Assure value is a valid JSON response
                    let json = jsonResponse.result.value as? [String : Any]
                    
                    // Handle errors
                    else {
                        complete?(false, nil, .couldNotParseJSON(description: "Could not parse JSON into [String : Any]"))
                        return
                }
                
                // Map JSON to native type using Mappable protocol.
                let object = Mapper<T>().map(JSON: json)
                
                // Complete with asynchronous callback
                complete?(true, object, nil)
        }
    }
    
    /// Get a list of Mappable Objects
    ///
    /// - Parameters:
    ///   - type: The type of objects being requested.
    ///   - parameters: The parameters required for requesting objects.
    ///   - complete: Asynchronous callback containing a success flag, the object that was requested, and an error string if failed. If unsuccessful: success = false, unsafeList = nil, unsafeError = String.
    func getList<T: Mappable>(of request: WooRequestConvertible,
                              then complete: WooCompletion.List<T>? = nil)
    {
        
        // Perform request
        alamofireManager.request(request)
            // Authenticate the session.
//            .authenticate(user: consumerKey, password: consumerSecret)
            // Handle response from request
            .responseJSON { jsonResponse in
                
                print(jsonResponse.response as Any)
                
                if let error = jsonResponse.error {
                    complete?(false, nil, .unsuccessfulRequestResponse(description: error.localizedDescription))
                    return
                }
                
                // Confirm there were no API errors
                if
                    let errorDict = jsonResponse.value as? [String: Any],
                    let code = errorDict["code"] as? String,
                    let message = errorDict["message"] as? String,
                    code == "woocommerce_rest_cannot_view" {
                    
                    complete?(false, nil, WooError.wooCommerceError(description: message))
                }
                
                // Confirm response data is in a JSON Array format.
                guard let json = jsonResponse.value as? [[String : Any]] else {
                    complete?(false, nil, .couldNotParseJSON(description: "JSON error: could not parse into array of dictionaries."))
                    return
                }
                
                // Map JSON Array to native type using Mappable protocol.
                let objects = Mapper<T>().mapArray(JSONArray: json)
                
                guard objects.count > 0 else {
                    complete?(false, nil, .noObjectsFoundForGivenRequest(description: "No objects found!"))
                    return
                }
                
                // Complete with asynchronous callback
                complete?(true, objects, nil)
        }
    }
}
