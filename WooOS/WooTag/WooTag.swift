
//
//  WooTag.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/9/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooTag: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// Tag name.
    var name: String?
    
    /// An alphanumeric identifier for the resource unique to its type.
    var slug: String?
    
    /// HTML description of the resource.
    var description: String?
    
    /// Number of published products for the resource.
    var count: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        description <- map["description"]
        count <- map["count"]
    }
}

/// Defines the order in which WooTag object are downloaded and displayed from WooCommerce.
///
/// - id: Order by the tag's ID
/// - include: Order by which products to be included.
/// - name: Order by the tag's name. This option is default.
/// - slug: Order by the tag's unique slug.
/// - termGroup: Order by the term group.
/// - description: Order by the tag's description.
/// - count: Order by the count of products with this tag.
public enum WooTagOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}

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
