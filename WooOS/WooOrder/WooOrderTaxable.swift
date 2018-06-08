//
//  WooOrderTaxable.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Determines whether an order is taxable.
///
/// - taxable: Order is taxable.
/// - none: Tax is not applicable.
enum WooOrderTaxable: String {
    case taxable = "taxable"
    case none = "none"
}
