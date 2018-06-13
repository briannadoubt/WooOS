//
//  WooAttributeRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The request parameter used while requesting WooAttribute objects from WooCommerce.
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
public enum WooAttributeRequestParameter: WooRequestParameter {
    
    case context(WooRequestContext)
    
    public var key: String{
        return "context"
    }
    
    public var value: Any {
        switch self {
        case .context(let context):
            return context.rawValue
        }
    }
}
