//
//  WooProductImage.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// <#Description#>
public class WooImage: Mappable {
    
    /// <#Description#>
    var id: WooID?
    
    /// <#Description#>
    var dateCreated: Date?
    
    /// <#Description#>
    var dateCreatedGMT: Date?
    
    /// <#Description#>
    var dateModified: Date?
    
    /// <#Description#>
    var dateModifiedGMT: Date?
    
    /// <#Description#>
    var src: URL?
    
    /// Image name.
    var name: String?
    
    /// <#Description#>
    var title: String?
    
    /// <#Description#>
    var alt: String?
    
    /// Image position. 0 means that the image is featured.
    var position: Int?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- (map["date_created"], using: ISO8601DateTransform())
        dateCreatedGMT <- (map["date_created_gmt"], using: ISO8601DateTransform())
        dateModified <- (map["date_modified"], using: ISO8601DateTransform())
        dateModifiedGMT <- (map["date_modified_gmt"], using: ISO8601DateTransform())
        name <- map["name"]
        src <- (map["src"], using: URLTransform())
        title <- map["title"]
        alt <- map["alt"]
        position <- map["position"]
    }
}
