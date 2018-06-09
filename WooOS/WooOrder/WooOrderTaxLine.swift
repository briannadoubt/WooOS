//
//  WooOrderTaxLine.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooOrderTaxLine: Mappable {
    
    /// Item ID.
    var id: WooID?
    
    /// Tax rate code.
    var rateCode: String?
    
    /// Tax rate ID.
    var rateID: WooID?
    
    /// Tax rate label.
    var label: String?
    
    /// Show if is a compound tax rate.
    var compound: Bool?
    
    /// Tax total (not including shipping taxes).
    var taxTotal: String?
    
    /// Shipping tax total.
    var shippingTaxTotal: String?
    
    /// Meta data. See Order - Meta data properties
    var metaData: [WooMetaData]?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        rateCode <- map["rate_code"]
        rateID <- map["rate_id"]
        label <- map["label"]
        compound <- map["compound"]
        taxTotal <- map["tax_total"]
        shippingTaxTotal <- map["shipping_tax_total"]
        metaData <- map["meta_data"]
    }
}
