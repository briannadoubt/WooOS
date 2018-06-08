//
//  WooMetaData.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// <#Description#>
public class WooMetaData: Mappable {
    
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
