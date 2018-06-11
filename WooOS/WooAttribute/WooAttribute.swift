//
//  WooAttribute.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// An attribute object associated to a product.
open class WooAttribute: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// Attribute name.
    var name: String?
    
    /// Attribute position.
    var position: Int?
    
    /// Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is false.
    var visible: Bool? = false
    
    /// Define if the attribute can be used as variation. Default is false.
    var isVariation: Bool? = false
    
    /// List of available term names of the attribute.
    var options: [String]?
    
    /// An alphanumeric identifier for the resource unique to its type.
    var slug: String?
    
    /// Type of attribute. Options: select and text. Default is select.
    var type: WooAttributeType? = .select
    
    /// Default sort order. Options: menu_order, name, name_num and id. Default is menu_order.
    var orderBy: WooAttributeOrderBy? = .menuOrder
    
    /// Enable/Disable attribute archives. Default is false.
    var hasArchives: Bool? = false
    
    /// The currently selected option of the attribute. This is a local attribute that is not downloaded or parsed from WooCommerce.
    var selectedOption: String? {
        didSet {
            guard let options = options else {
                return
            }
            
            for index in 0..<options.count {
                let option = options[index]
                if selectedOption == option {
                    selectedOptionIndex = index
                }
            }
        }
    }
    
    var selectedOptionIndex: Int?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        position <- map["position"]
        visible <- map["visible"]
        isVariation <- map["variation"]
        options <- map["options"]
        slug <- map["slug"]
        type <- map["type"]
        orderBy <- map["order_by"]
        hasArchives <- map["has_archives"]
    }
}
