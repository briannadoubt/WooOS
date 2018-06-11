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
    public var id: WooID?
    
    /// Attribute name.
    public var name: String?
    
    /// Attribute position.
    public var position: Int?
    
    /// Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is false.
    public var visible: Bool? = false
    
    /// Define if the attribute can be used as variation. Default is false.
    public var isVariation: Bool? = false
    
    /// List of available term names of the attribute.
    public var options: [String]?
    
    /// An alphanumeric identifier for the resource unique to its type.
    public var slug: String?
    
    /// Type of attribute. Options: select and text. Default is select.
    public var type: WooAttributeType? = .select
    
    /// Default sort order. Options: menu_order, name, name_num and id. Default is menu_order.
    public var orderBy: WooAttributeOrderBy? = .menuOrder
    
    /// Enable/Disable attribute archives. Default is false.
    public var hasArchives: Bool? = false
    
    /// The currently selected option of the attribute. This is a local attribute that is not downloaded or parsed from WooCommerce.
    public var selectedOption: String? {
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
    
    /// The index of the currently selected option
    public var selectedOptionIndex: Int?
    
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
