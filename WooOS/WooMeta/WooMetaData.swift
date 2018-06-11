//
//  WooMetaData.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A Meta data object found in WooCommerce requests.
public class WooMetaData: Mappable {
    
    /// Meta ID.
    public var id: String?
    
    /// Meta key.
    public var key: String?
    
    /// Meta value.
    public var value: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
        value <- map["value"]
    }
}
