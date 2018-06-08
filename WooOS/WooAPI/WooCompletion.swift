//
//  WooCompletion.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// Parent class containing all the various types of completion handlers used in WooAPI.
class WooCompletion {
    
    /// A completion handler that returns the parameters associated to requesting an array of objects from WooCommerce.
    ///
    /// - Parameters:
    ///   - success: The type of objects being requested.
    ///   - value: The returned array of objects from the network request. Nil if an error occurs.
    ///   - error: An instance of `WooError` that includes a description of any error that exists. This parameter is nil if no error occurs.
    typealias List<T: BaseMappable> = (_ success: Bool, _ value: [T]?, _ error: WooError?) -> Void
    
    /// A completion handler that returns the parameters associated to requesting a single object from WooCommerce.
    ///
    /// - Parameters:
    ///   - success: The type of objects being requested.
    ///   - value: The returned object from the network request. Nil if an error occurs.
    ///   - error: An instance of `WooError` that includes a description of any error that exists. This parameter is nil if no error occurs.
    typealias Object<T: BaseMappable> = (_ success: Bool, _ value: T?, _ error: WooError?) -> Void
    
    /// The completion handler used while requesting a token from the WooCommerce server.
    ///
    /// - Parameters:
    ///   - success: The type of objects being requested.
    ///   - token: The token returned when requesting a new token. Nil if an error occurs.
    ///   - error: An instance of `WooError` that includes a description of any error that exists. This parameter is nil if no error occurs.
    typealias Token = (_ success: Bool, _ token: String?, _ error: WooError?) -> Void
    
    /// A simple completion with a success flag and an error.
    ///
    /// - Parameters:
    ///   - success: The type of objects being requested.
    ///   - error: An instance of `WooError` that includes a description of any error that exists. This parameter is nil if no error occurs.
    typealias Success = (_ success: Bool, _ error: WooError?) -> Void
    
    /// A simple completion with no parameters.
    typealias Completion = () -> Void
}
