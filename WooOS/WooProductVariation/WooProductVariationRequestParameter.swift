//
//  WooProductVariationRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The parameter used to request and filter Product variations from WooAPI
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
/// - page: Current page of the collection. Default is 1.
/// - perPage: Maximum number of items to be returned in result set. Default is 10.
/// - search: Limit results to those matching a string.
/// - after: Limit response to resources published after a given ISO8601 compliant date.
/// - before: Limit response to resources published before a given ISO8601 compliant date.
/// - exclude: Ensure result set excludes specific IDs.
/// - include: Limit result set to specific ids.
/// - offset: Offset the result set by a specific number of items.
/// - order: Order sort attribute ascending or descending. Options: asc and desc. Default is desc.
/// - orderby: Sort collection by object attribute. Options: date, id, include, title and slug. Default is date.
/// - parent: Limit result set to those of particular parent IDs.
/// - parentExclude: Limit result set to all items except those of a particular parent ID.
/// - slug: Limit result set to products with a specific slug.
/// - status: Limit result set to products assigned a specific status. Options: any, draft, pending, private and publish. Default is any.
/// - type: Limit result set to products assigned a specific type. Options: simple, grouped, external and variable.
/// - sku: Limit result set to products with a specific SKU.
/// - featured: Limit result set to featured products.
/// - category: Limit result set to products assigned a specific category ID.
/// - tag: Limit result set to products assigned a specific tag ID.
/// - shippingClass: Limit result set to products assigned a specific shipping class ID.
/// - attribute: Limit result set to products with a specific attribute.
/// - attributeTerm: Limit result set to products with a specific attribute term ID (required an assigned attribute).
/// - taxClass: Limit result set to products with a specific tax class. Default options: standard, reduced-rate and zero-rate.
/// - inStock: Limit result set to products in stock or out of stock.
/// - onSale: Limit result set to products on sale.
/// - minPrice: Limit result set to products based on a minimum price.
/// - maxPrice: Limit result set to products based on a maximum price.
enum WooProductVariationRequestParameter: WooRequestParameter {
    case context(WooRequestContext)
    case page(Int)
    case perPage(Int)
    case search(String)
    case after(Date)
    case before(Date)
    case exclude([WooID])
    case include([WooID])
    case offset(Int)
    case order(WooSortOrder)
    case orderBy(WooProductOrderBy)
    case parent([WooID])
    case parentExclude([WooID])
    case slug(String)
    case status(WooProductStatus)
    case type(WooProductType)
    case sku(String)
    case featured(Bool)
    case category(WooID)
    case tag(WooID)
    case shippingClass(WooID)
    case attribute(WooID)
    case attributeTerm(WooID)
    case taxClass(WooTaxClass)
    case inStock(Bool)
    case onSale(Bool)
    case minPrice(String)
    case maxPrice(String)
    
    var key: String {
        switch self {
        case .context:
            return "context"
        case .page:
            return "page"
        case .perPage:
            return "per_page"
        case .search:
            return "search"
        case .after:
            return "after"
        case .before:
            return "before"
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
        case .parent:
            return "parent"
        case .parentExclude:
            return "parent_exclude"
        case .slug:
            return "slug"
        case .status:
            return "status"
        case .type:
            return "type"
        case .sku:
            return "sku"
        case .featured:
            return "featured"
        case .category:
            return "category"
        case .tag:
            return "tag"
        case .shippingClass:
            return "shipping_class"
        case .attribute:
            return "attribute"
        case .attributeTerm:
            return "attribute_term"
        case .taxClass:
            return "tax_class"
        case .inStock:
            return "in_stock"
        case .onSale:
            return "on_sale"
        case .minPrice:
            return "min_price"
        case .maxPrice:
            return "max_price"
        }
    }
    
    var value: Any {
        switch self {
        case .context(let context):
            return context.rawValue
            
        case .page(let page):
            return page
            
        case .perPage(let perPage):
            return perPage
            
        case .search(let search):
            return search
            
        case .after(let after):
            return after
            
        case .before(let before):
            return before
            
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
            
        case .parent(let parent):
            return parent
            
        case .parentExclude(let parentExclude):
            return parentExclude
            
        case .slug(let slug):
            return slug
            
        case .status(let status):
            return status.rawValue
            
        case .type(let type):
            return type.rawValue
            
        case .sku(let sku):
            return sku
            
        case .featured(let featured):
            return featured
            
        case .category(let category):
            return category
            
        case .tag(let tag):
            return tag
            
        case .shippingClass(let shippingClass):
            return shippingClass
            
        case .attribute(let attribute):
            return attribute
            
        case .attributeTerm(let attributeTerm):
            return attributeTerm
            
        case .taxClass(let taxClass):
            return taxClass.rawValue
            
        case .inStock(let inStock):
            return inStock
            
        case .onSale(let onSale):
            return onSale
            
        case .minPrice(let minPrice):
            return minPrice
            
        case .maxPrice(let maxPrice):
            return maxPrice
        }
    }
}
