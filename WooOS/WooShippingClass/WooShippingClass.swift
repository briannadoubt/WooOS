//
//  WooShippingClass.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/4/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The product shipping class API allows you to create, view, update, and delete individual shipping classes.
open class WooShippingClass: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// Shipping class name.
    public var name: String?
    
    /// An alphanumeric identifier for the resource unique to its type.
    public var slug: String?
    
    /// HTML description of the resource.
    public var description: String?
    
    /// Number of published products for the resource.
    public var count: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        description <- map["description"]
        count <- map["count"]
    }
}
