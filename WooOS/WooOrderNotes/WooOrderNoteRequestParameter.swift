//
//  WooOrderNoteRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Parameters used to filter requests for WooOrderNote type.
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
/// - type: Limit result to customers or internal notes. Options: any, customer and internal. Default is any.
enum WooOrderNoteRequestParameter: WooRequestParameter {
    case context(WooRequestContext)
    case type(WooOrderNoteType)
    
    var key: String {
        switch self {
        case .context:
            return "context"
        case .type:
            return "type"
        }
    }
    
    var value: Any {
        switch self {
        case .context(let context):
            return context.rawValue
        
        case .type(let type):
            return type.rawValue
        }
    }
}
