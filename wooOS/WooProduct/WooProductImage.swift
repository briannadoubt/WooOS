//
//  WooProductImage.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooProductImage: Mappable {
    
    var id: Int?
    var dateCreated: Date?
    var dateCreatedGMT: Date?
    var dateModified: Date?
    var dateModifiedGMT: Date?
    var src: URL?
    var title: String?
    var alt: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- (map["date_created"], using: ISO8601DateTransform())
        dateCreatedGMT <- (map["date_created_gmt"], using: ISO8601DateTransform())
        dateModified <- (map["date_modified"], using: ISO8601DateTransform())
        dateModifiedGMT <- (map["date_modified_gmt"], using: ISO8601DateTransform())
        src <- (map["src"], using: URLTransform())
        title <- map["title"]
        alt <- map["alt"]
    }
}
