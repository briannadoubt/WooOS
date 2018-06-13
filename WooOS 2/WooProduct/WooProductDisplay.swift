//
//  WooProductDisplay.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// How to display the requested products.
///
/// - Default: The default display setting.
/// - products: The products display.
/// - subcategories: The subcategories display.
/// - both: Display both.
public enum WooProductDisplay: String {
    case Default = "default"
    case products = "products"
    case subcategories = "subcategories"
    case both = "both"
    
    public init() {
        self = .Default
    }
}
