
//
//  WooTag.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/9/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A product tag object.
open class WooTag: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// Tag name.
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
