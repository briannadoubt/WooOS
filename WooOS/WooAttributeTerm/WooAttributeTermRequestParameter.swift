//
//  WooAttributeTermRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Request parameters used to filter attribute terms for a specific attribute of a product.
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
/// - page: Current page of the collection. Default is 1.
/// - perPage: Maximum number of items to be returned in result set. Default is 10.
/// - search: Limit results to those matching a string.
/// - exclude: Ensure result set excludes specific ids.
/// - include: Limit result set to specific ids.
/// - order: Order sort attribute ascending or descending. Options: asc and desc. Default is asc.
/// - orderBy: Sort collection by resource attribute. Options: id, include, name, slug, term_group, description and count. Default is name.
/// - hideEmpty: Whether to hide resources not assigned to any products. Default is false.
/// - parent: Limit result set to resources assigned to a specific parent.
/// - product: Limit result set to resources assigned to a specific product.
/// - slug: Limit result set to resources with a specific slug.
public enum WooAttributeTermRequestParameter: WooRequestParameter {
    case context(WooRequestContext)
    case page(Int)
    case perPage(Int)
    case search(String)
    case exclude([WooID])
    case include([WooID])
    case order(WooSortOrder)
    case orderBy(WooAttributeTermOrderBy)
    case hideEmpty(Bool)
    case parent(WooID)
    case product(WooID)
    case slug(String)
    
    public var key: String {
        switch self {
        case .context:
            return "context"
        case .page:
            return "page"
        case .perPage:
            return "per_page"
        case .search:
            return "search"
        case .exclude:
            return "exclude"
        case .include:
            return "include"
        case .order:
            return "order"
        case .orderBy:
            return "order_by"
        case .hideEmpty:
            return "hide_empty"
        case .parent:
            return "parent"
        case .product:
            return "product"
        case .slug:
            return "slug"
        }
    }
    
    public var value: Any {
        switch self {
        case .context(let context):
            return context.rawValue
            
        case .page(let page):
            return page
            
        case .perPage(let perPage):
            return perPage
            
        case .search(let search):
            return search
            
        case .exclude(let exclude):
            return exclude
            
        case .include(let include):
            return include
            
        case .order(let order):
            return order.rawValue
            
        case .orderBy(let orderBy):
            return orderBy.rawValue
            
        case .hideEmpty(let hideEmpty):
            return hideEmpty
            
        case .parent(let parent):
            return parent
            
        case .product(let product):
            return product
            
        case .slug(let slug):
            return slug
        }
    }
}
