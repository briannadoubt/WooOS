//
//  WooAttributeTerm.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The individual term of a product attribute. An attribute would be "Color", and the term would be "Blue".
public class WooAttributeTerm: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// Term name.
    var name: String?
    
    /// An alphanumeric identifier for the resource unique to its type.
    var slug: String?
    
    /// HTML description of the resource.
    var description: String?
    
    /// Menu order, used to custom sort the resource.
    var menuOrder: Int?
    
    /// Number of published products for the resource.
    var count: Int?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        description <- map["description"]
        menuOrder <- map["menu_order"]
        count <- map["count"]
    }
}
