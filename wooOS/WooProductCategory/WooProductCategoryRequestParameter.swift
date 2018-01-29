//
//  WooProductCategoryRequestParameter.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// <#Description#>
///
/// - context: <#context description#>
/// - page: <#page description#>
/// - perPage: <#perPage description#>
/// - search: <#search description#>
/// - exclude: <#exclude description#>
/// - include: <#include description#>
/// - order: <#order description#>
/// - orderBy: <#orderBy description#>
/// - parent: <#parent description#>
/// - product: <#product description#>
/// - slug: <#slug description#>
public enum WooProductCategoryRequestParameter {
    case context(String)
    case page(Int)
    case perPage(Int)
    case search(String)
    case exclude([String])
    case include([String])
    case order(WooSortOrder)
    case orderBy(WooOrderBy)
    case parent(Int)
    case product(Int)
    case slug(String)
}
