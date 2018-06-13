//
//  WooRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Protocol that defines attributes of a request parameter state machine.
public protocol WooRequestParameter {
    
    /// The path for the given parameter, used as the key in the parameter value.
    var key: String { get }

    /// The parameter used when constructing a parameter array.
    var value: Any { get }
}

public extension Array where Element: WooRequestParameter {
    
    /// Returns a JSON object from request parameters.
    ///
    /// - Returns: [String: Any]
    func toJSON() -> [String: Any] {
        
        // Create the list parameters dictionary to be returned and used in the request.
        var json: [String: Any] = [:]
        
        // Add each parameter from the given parameters dictionary to the list parameters dictionary to be used in the request.
        for parameter in self {
            json[parameter.key] = parameter.value
        }
        
        return json
    }
    
}
