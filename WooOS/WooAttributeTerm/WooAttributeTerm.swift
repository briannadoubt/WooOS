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
open class WooAttributeTerm: Mappable {
    
    /// Unique identifier for the resource.
    public var id: Int?
    
    /// Term name.
    public var name: String?
    
    // Options
    public var option: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        option <- map["option"]
    }
}
