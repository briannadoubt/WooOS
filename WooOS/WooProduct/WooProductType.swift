//
//  WooProductType.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Describes the WooCommerce type that is being requested
///
/// - simple: The standard WooCommerce product type.
/// - grouped: A group of simple products sold as a single product and priced appropriately.
/// - external: Products that are external to WooCommerce, such as a third party product listed on another website.
/// - variable: A product that contains a variety of product variations based on variable attributes.
public enum WooProductType: String {
    case simple = "simple"
    case grouped = "grouped"
    case external = "external"
    case variable = "variable"
}
