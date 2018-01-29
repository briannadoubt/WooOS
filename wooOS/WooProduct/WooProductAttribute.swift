//
//  WooProductAttribute.swift
//  Art On T-Shirt
//
//  Created by brianna on 12/12/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation
import ObjectMapper

struct WooProductAttribute: Mappable {
    
    /// Attribute ID.
    var id: Int?
    
    /// Attribute name.
    var name: String?
    
    /// Attribute position.
    var position: Int?
    
    /// Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is false.
    var visible: Bool? = false
    
    /// Define if the attribute can be used as variation. Default is false.
    var variation: Bool? = false
    
    /// List of available term names of the attribute.
    var options: [String]?
    
    var selectedOption: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
        visible <- map["visible"]
        variation <- map["variation"]
        options <- map["options"]
    }
}
