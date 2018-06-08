//
//  WooCustomerRequestParameter.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/2/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Request parameters for listing a customer from WooCommerce
///
/// - context: Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
/// - page: Current page of the collection. Default is 1.
/// - perPage: Maximum number of items to be returned in result set. Default is 10.
/// - search: Limit results to those matching a string.
/// - exclude: Ensure result set excludes specific IDs.
/// - include: Limit result set to specific IDs.
/// - offset: Offset the result set by a specific number of items.
/// - order: Order sort attribute ascending or descending. Options: asc and desc. Default is asc.
/// - orderby: Sort collection by object attribute. Options: id, include, name and registered_date. Default is name.
/// - email: Limit result set to resources with a specific email.
/// - role: Limit result set to resources with a specific role. Options: all, administrator, editor, author, contributor, subscriber, customer and shop_manager. Default is customer.
enum WooCustomerRequestParameter: WooRequestParameter {
    case context(WooRequestContext)
    case page(Int)
    case perPage(Int)
    case search(String)
    case exclude([WooID])
    case include([WooID])
    case offset(Int)
    case order(WooSortOrder)
    case orderBy(WooCustomerOrderBy)
    case email(String)
    case role(WooCustomerRole)
    
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
        case .email:
            return "email"
        case .role:
            return "role"
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
            
        case .exclude(let exclude):
            return exclude
            
        case .include(let include):
            return include
            
        case .offset(let offset):
            return offset
            
        case .order(let order):
            return order
            
        case .orderBy(let orderBy):
            return orderBy
            
        case .email(let email):
            return email
            
        case .role(let role):
            return role
        }
    }
}

/// Sort collection by WooCustomer attribute.
///
/// - id: The ID of the WooCustomer.
/// - include: Which customers to include.
/// - name: Order by name.
/// - registeredDate: Order by date registered.
enum WooCustomerOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case registeredDate = "registered_date"
}

/// Limit result set to resources with a specific role.
///
/// - all: Grants all priviledges
/// - editor: Grants ability to edit pages and products.
/// - author: Allows for authoring pages.
/// - contributor: Allows user to contribute to existing pages.
/// - subscriber: Default WordPress user role.
/// - customer: Default WooCommerce user role.
/// - shopManager: Allows user to edit products, inventory and orders.
enum WooCustomerRole: String {
    case all = "all"
    case editor = "editor"
    case author = "author"
    case contributor = "contributor"
    case subscriber = "subscriber"
    case customer = "customer"
    case shopManager = "shop_manager"
}
