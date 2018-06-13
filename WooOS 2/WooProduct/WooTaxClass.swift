//
//  WooTaxClass.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Determines the tax class of the product.
///
/// - standard: Standard default tax rate.
/// - reducedRate: Reduced rate, less than standard rate.
/// - zeroRate: No tax.
public enum WooTaxClass: String {
    case standard = "standard"
    case reducedRate = "reduced-rate"
    case zeroRate = "zero-rate"
}
