//
//  WooProductCatelogVisibility.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The visibility level of the products being requested.
///
/// - visible: Only visible products.
/// - catalog: Only products listed in the catelog.
/// - search: Obly products that are allowed to be shown in a search query.
/// - hidden: Only hidden products.
public enum WooProductCatalogVisibility: String {
    case visible = "visible"
    case catalog = "catalog"
    case search = "search"
    case hidden = "hidden"
}
