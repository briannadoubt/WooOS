//
//  WooTaxStatus.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The status of the tax of a product.
///
/// - taxable: Defines whether or not the product should be taxed.
/// - shipping: Defines if shipping should be taxed.
/// - none: No tax associated.
public enum WooTaxStatus: String {
    case taxable = "taxable"
    case shipping = "shipping"
    case none = "none"
    
    public init() {
        self = .none
    }
}
