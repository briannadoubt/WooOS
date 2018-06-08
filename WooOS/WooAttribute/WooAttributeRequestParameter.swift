//
//  WooAttributeRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

public enum WooAttributeRequestParameter: WooRequestParameter {
    
    case context(WooRequestContext)
    
    var key: String{
        return "context"
    }
    
    var value: Any {
        switch self {
        case .context(let context):
            return context.rawValue
        }
    }
}
