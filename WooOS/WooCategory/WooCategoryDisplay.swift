//
//  WooCategoryDisplay.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Defines the display method for the category that is being downloaded.
///
/// - defaultDisplay: The default display method, set in WooCommerce settings.
/// - products: Display all products of a category.
/// - subcategories: Display all subcategories of a category.
/// - both: Display both the subcategories and all the associated products of a category.
public enum WooCategoryDisplay: String {
    case defaultDisplay = "default"
    case products = "products"
    case subcategories = "subcategories"
    case both = "both"
}
