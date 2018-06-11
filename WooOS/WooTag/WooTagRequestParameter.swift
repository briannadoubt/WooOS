//
//  WooTagRequestParameter.swift
//  WooOS-iOS
//
//  Created by Brie on 6/10/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

/// The requeat parameters for listing tags from WooCommerce
///
/// - context: The context of the request.
/// - page: The page number of the page being requested.
/// - perPage: Number of items to list per page.
/// - search: The search query string for the request.
/// - exclude: Array of tags to exclude.
/// - include: Array of tags to include.
/// - offset: Number of tags to offset the request by.
/// - order: The sort order of the requested tags.
/// - orderBy: Define whether the list is scending or descending.
/// - hideEmpty: Flag to hide or show hidden tags.
/// - parent: List tags with a common parent tag.
/// - product: List tags with a common product.
/// - slug: List a tag with a specific slug.
public enum WooTagRequestParameter {
    case context(WooRequestContext)
    case page(Int)
    case perPage(Int)
    case search(String)
    case exclude([WooID])
    case include([WooID])
    case offset(Int)
    case order(WooSortOrder)
    case orderBy(WooTagOrderBy)
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
        case .offset:
            return "offset"
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
            
        case .offset(let offset):
            return offset
            
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
