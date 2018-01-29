//
//  WooError.swift
//  Eightfold
//
//  Created by brianna on 1/21/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

enum WooError: Error {
    case customerIDNil
    
    var string: String {
        switch self {
        case .customerIDNil:
            return "Customer ID is nil."
        }
    }
}
