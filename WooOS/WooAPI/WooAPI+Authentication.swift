//
//  WooAPI+Authentication.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/12/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import Locksmith

public extension WooAPI {
    
    /// Generates the HTTP headers with the stored auth token.
    ///
    /// - Parameter token: The stored token to be embedded in the HTTP header
    /// - Returns: ["Authorization" : "Bearer \(token ?? "")"]
    func authHeaders(with token: String?) -> [String: String]? {
        
        // Safely unwrap token
        guard let safeToken = token else {
            return nil
        }
        
        // Build headers dictionary of type [String : String]
        let authHeaders = ["Authorizaion" : "Bearer \(safeToken)"]
        return authHeaders
    }
    
    /// Generates the URLCredential needed for authenticating with either WooCommerce with the Basic authentication method. This method requires the consumerKey and consumerSecret to be set and copied into the codebase.
    ///
    /// - Returns: URLCredential with consumerKey as user and consumerSecret as password.
    /// - Throws: WooError.managerCredentialsAreNil
    func managerURLCredential() throws -> URLCredential {
        
        guard
            let key = consumerKey,
            let secret = consumerSecret
            else {
                throw WooError.managerCredentialsAreNil(description: "Either the consumer key or the consumer secret has no value.")
        }
        
        return URLCredential(user: key,
                             password: secret,
                             persistence: URLCredential.Persistence.synchronizable)
    }
    
    private func username(from email: String) -> String {
        let at = "@"
        let emailComponents = email.components(separatedBy: at)
        guard let username = emailComponents.first else {
            let error = WooError.noUsernameSet(description: "Failed to seperate username from email.")
            print(error.string, error.localizedDescription)
            return ""
        }
        return username
    }
    
    /// Create a new user and sign them in with supplied first name, last name, username, and password.
    ///
    /// - Parameters:
    ///   - firstName: The first name of the customer.
    ///   - lastName: The last name of the customer.
    ///   - username: The chosen username by the customer.
    ///   - password: The given password by the customer.
    ///   - complete: Asynchronous callback containing a success flag and an error string if failed. If unsuccessful: success = false, error = String.
    func signUp(with firstName: String,
                lastName: String,
                username: String,
                email: String,
                and password: String,
                then complete: @escaping WooCompletion.Success) {
        
        let authBody = [
            "username": self.username(from: email),
            "email": email,
            "password": password
        ]
        
        guard let url = URL(string: "/wp-json/wp/v2/users/register", relativeTo: siteURL) else {
            complete(false, WooError.invalidURL(description: "Could not build user registration url."))
            return
        }
        
        alamofireManager.request(url, parameters: authBody)
            .responseJSON { responseJSON in
                guard
                    responseJSON.result.isSuccess
                    else {
                        complete(false, WooError.couldNotParseJSON(description: "Result was not a success and/or the response is not valid JSON data."))
                        return
                }
                
                guard
                    let json = responseJSON.value as? [String: Any],
                    let code = json["code"] as? Int,
                    let message = json["message"] as? String
                    else {
                        complete(false, WooError.couldNotParseJSON(description: "Could not extract JSON data from response."))
                        return
                }
                
                guard
                    code == 200
                    else {
                        print("WooOS Authentication Response Code was not 200. Instead it was \(code), with the message \"\(message)\"")
                        complete(false, WooError.signupFailed(description: message))
                        return
                }
                
                complete(true, nil)
        }
    }
    
    private func getNonce(then complete: @escaping WooCompletion.Token) {
        guard let url = URL(string: "/api/get_nonce/", relativeTo: siteURL) else {
            complete(false, nil, WooError.invalidURL(description: "Could not build nonce url."))
            return
        }
        
        let parameters: Parameters = ["controller": "user", "method": "register"]
        
        alamofireManager.request(url, parameters: parameters)
            .responseJSON { responseJSON in
            guard
                responseJSON.result.isSuccess,
                let json = responseJSON.value as? [String: Any],
                let nonce = json["nonce"] as? String
                else {
                    complete(false, nil, .couldNotParseJSON(description: "Resulting JSON is wrong format while getting nonce."))
                    return
                }
                
                complete(true, nonce, nil)
        }
    }
    
    /// Login user with supplied username and password.
    ///
    /// - Parameters:
    ///   - username: String of Username provided by User.
    ///   - password: String of Password provided by User.
    ///   - complete: Asynchronous callback containing a success flag and an error string if failed. If unsuccessful: success = false, error = String.
    func login(with username: String,
               and password: String,
               then complete: @escaping WooCompletion.Token) {
        
        // Request token using given username and password
        getToken(with: username, and: password, then: complete)
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
        
        // Build Request URL to get token
        guard let requestURL = URL(string: "wp-json/jwt-auth/v1/token", relativeTo: siteURL) else {
            complete(false, nil, WooError.cannotConstructURL(description: "Could not build token URL"))
            return
        }
        
        // Build parameters required for getting token
        let tokenParameters = ["username": username, "password": password]
        
        // Make request
        alamofireManager.request(requestURL,
                                 method: .post,
                                 parameters: tokenParameters)
            // Handle reponse
            .responseJSON { responseJSON in
                
                guard
                    // Confirm HTTP response is success
                    responseJSON.result.isSuccess,
                    
                    // Confirm response body value is in JSON format
                    let json = responseJSON.result.value as? [String: Any],
                    
                    // Extract token from JSON
                    let newToken = json["token"] as? String
                    
                    // Handle error
                    else {
                        complete(false, nil, WooError.couldNotGetToken(description: "Failed to get token"))
                        return
                }
                
                // Save token to
                self.persistToken(newToken)
                
                complete(true, newToken, nil)
                
//                self.persistToken(newToken) { success, error in
//                    if success {
//                        // Asynchronous callback with new token value
//                        complete(true, newToken, nil)
//                    } else {
//                        complete(false, newToken, WooError.noToken(description: "Unable to persist token after retrieving it from the server."))
//                    }
//                }
        }
    }
    
    /// Log user out by revoking the token on the server, deleting the token locally, and deleting the stored user in `WooOS.main`.
    func logout(then complete: WooCompletion.Completion? = nil) {
        
        // Remove stored token
        UserDefaults.standard.set(nil, forKey: "token")
        
        // Remove stored customer
        WooOS.main.currentCustomer = nil
        
        complete?()
    }
    
    func token() -> String? {
        return UserDefaults.standard.string(forKey: "token")
    }
    
    func persistToken(_ token: String, then complete: WooCompletion.Success? = nil) {
        
        UserDefaults.standard.set(token, forKey: "token")
        
//        guard
//            // Unwrap username
//            let username = WooOS.main.currentCustomer?.username
//
//            // Handle nil values
//            else {
//                complete(false, WooError.couldNotSaveToken(description: "Invalid username: Username is nil."))
//                return
//        }
//
//        do {
//            // Save newValue to keychain
//            try Locksmith.saveData(data: ["token": token], forUserAccount: username, inService: WooAPI.keychainService)
//
//            // Handle errors
//        } catch {
//            complete(false, WooError.couldNotSaveToken(description: "Failed saving data with Locksmith: " + error.localizedDescription))
//        }
//
//        complete(true, nil)
    }
    
    /// Confirm the token that is currently in use is still valid.
    ///
    /// - Parameter complete: Completion to confirm whether or not the token was validated successfully.
    private func validate(token: String, then complete: @escaping WooCompletion.Success) {
        
        // Build request URL to validate token
        guard let requestURL = URL(string: "wp-json/jwt-auth/v1/token/validate", relativeTo: siteURL) else {
            complete(false, WooError.cannotConstructURL(description: "Could not build token validation URL"))
            return
        }
        
        // Make request
        alamofireManager.request(requestURL,
                                 method: .post,
                                 headers: authHeaders(with: token))
            // Handle response
            .responseJSON { response in
                guard
                    // Confirm result is success
                    response.result.isSuccess,
                    
                    // Confirm response value is in JSON format
                    let json = response.result.value as? [String: Any],
                    
                    // Extract nested 'data' dictionary
                    let data = json["data"] as? [String : Any],
                    
                    // Extract the 'status' value from the 'data' dictionary as an Int
                    let status = data["status"] as? Int,
                    
                    // Confirm 'status' is equal to 200, or OK
                    status == 200
                    
                    // Handle error
                    else {
                        complete(false, .couldNotParseJSON(description: "Could not parse JSON in response to token validation."))
                        return
                }
                
                // Run asynchronous completion block with success flag!
                complete(true, nil)
        }
    }
}
