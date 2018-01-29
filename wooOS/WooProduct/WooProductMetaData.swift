//
//  WooProductMetaData.swift
//  Eightfold
//
//  Created by brianna on 1/27/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooProductMetaData: Mappable {
    
    /// Meta ID.
    var id: String?
    /// Meta key.
    var key: String?
    /// Meta value.
    var value: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
        value <- map["value"]
    }
}
