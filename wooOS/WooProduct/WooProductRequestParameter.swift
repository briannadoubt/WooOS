//
//  WooProductRequestParameters.swift
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
/// - after: <#after description#>
/// - before: <#before description#>
/// - exclude: <#exclude description#>
/// - include: <#include description#>
/// - offset: <#offset description#>
/// - order: <#order description#>
/// - orderby: <#orderby description#>
/// - parent: <#parent description#>
/// - parentExclude: <#parentExclude description#>
/// - slug: <#slug description#>
/// - status: <#status description#>
/// - type: <#type description#>
/// - sku: <#sku description#>
/// - featured: <#featured description#>
/// - category: <#category description#>
/// - tag: <#tag description#>
/// - shippingClass: <#shippingClass description#>
/// - attribute: <#attribute description#>
/// - attribute_term: <#attribute_term description#>
/// - tax_class: <#tax_class description#>
/// - inStock: <#inStock description#>
/// - onSale: <#onSale description#>
/// - minPrice: <#minPrice description#>
/// - maxPrice: <#maxPrice description#>
public enum WooProductRequestParameter {
    case context(String)
    case page(Int)
    case perPage(Int)
    case search(String)
    case after(Date)
    case before(Date)
    case exclude([String])
    case include([String])
    case offset(Int)
    case order(String)
    case orderby(String)
    case parent([String])
    case parentExclude([String])
    case slug(String)
    case status(String)
    case type(String)
    case sku(String)
    case featured(Bool)
    case category(String)
    case tag(String)
    case shippingClass(String)
    case attribute(String)
    case attribute_term(String)
    case tax_class(String)
    case inStock(Bool)
    case onSale(Bool)
    case minPrice(String)
    case maxPrice(String)
}
