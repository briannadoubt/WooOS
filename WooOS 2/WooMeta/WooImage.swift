//
//  WooProductImage.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// An object used to represent an image downloaded from WooCommerce.
public class WooImage: Mappable {
    
    /// The ID of the image.
    public var id: WooID?
    
    /// The date this image was uploaded.
    public var dateCreated: Date?
    
    /// The date this image was uploaded in GMT.
    public var dateCreatedGMT: Date?
    
    /// The date this image was modified.
    public var dateModified: Date?
    
    /// The date this image was modified in GMT.
    public var dateModifiedGMT: Date?
    
    /// The source URL of the image on the server.
    public var src: URL?
    
    /// Image name.
    public var name: String?
    
    /// The title of the image on WooCommerce.
    public var title: String?
    
    /// The Alt description of the image on WooCommerce.
    public var alt: String?
    
    /// Image position. 0 means that the image is featured.
    public var position: Int?
    
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
