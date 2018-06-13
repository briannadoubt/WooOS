//
//  WooOrderTaxLine.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A line on an order representing one piece of tax information.
public class WooOrderTaxLine: Mappable {
    
    /// Item ID.
    public var id: WooID?
    
    /// Tax rate code.
    public var rateCode: String?
    
    /// Tax rate ID.
    public var rateID: WooID?
    
    /// Tax rate label.
    public var label: String?
    
    /// Show if is a compound tax rate.
    public var compound: Bool?
    
    /// Tax total (not including shipping taxes).
    public var taxTotal: String?
    
    /// Shipping tax total.
    public var shippingTaxTotal: String?
    
    /// Meta data. See Order - Meta data properties
    public var metaData: [WooMetaData]?
    
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
