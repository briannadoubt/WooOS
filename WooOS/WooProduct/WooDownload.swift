//
//  WooDownload.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The object representing the download associated to a product.
public class WooDownload: Mappable {
    
    /// File MD5 hash.
    public var id: WooID?
    
    /// File name.
    public var name: String?
    
    /// File URL.
    public var file: URL?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        file <- (map["file"], using: URLTransform())
    }
}
