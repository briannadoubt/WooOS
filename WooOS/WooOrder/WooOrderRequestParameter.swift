//
//  WooOrderRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/2/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Request parameters used when listing WooOrder objects with WooAPI.
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
/// - page: Current page of the collection. Default is 1.
/// - perPage: Maximum number of items to be returned in result set. Default is 10.
/// - search: Limit results to those matching a string.
/// - after: Limit response to resources published after a given ISO8601 compliant date.
/// - before: Limit response to resources published before a given ISO8601 compliant date.
/// - exclude:Ensure result set excludes specific IDs.
/// - include: Limit result set to specific ids.
/// - offset: Offset the result set by a specific number of items.
/// - order: Order sort attribute ascending or descending. Options: asc and desc. Default is desc.
/// - orderby: Sort collection by object attribute. Options: date, id, include, title and slug. Default is date.
/// - parent: Limit result set to those of particular parent IDs.
/// - parentExclude: Limit result set to all items except those of a particular parent ID.
/// - status: Limit result set to orders assigned a specific status. Options: any, pending, processing, on-hold, completed, cancelled, refunded and failed. Default is any.
/// - customer: Limit result set to orders assigned a specific customer.
/// - product: Limit result set to orders assigned a specific product.
/// - decimalPoint: Number of decimal points to use in each resource. Default is 2.
public enum WooOrderRequestParameter: WooRequestParameter {
    
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
    case orderBy(WooSortResultsBy)
    case parent([WooID])
    case parentExclude([WooID])
    case status(WooOrderStatus)
    case customer(WooID)
    case product(WooID)
    case decimalPoint(Int)
    
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
        case .status:
            return "status"
        case .customer:
            return "customer"
        case .product:
            return "product"
        case .decimalPoint:
            return "dp"
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
            
        case .status(let status):
            return status.rawValue
            
        case .customer(let customer):
            return customer
            
        case .product(let product):
            return product
            
        case .decimalPoint(let decimalPoint):
            return decimalPoint
        }
    }
}
