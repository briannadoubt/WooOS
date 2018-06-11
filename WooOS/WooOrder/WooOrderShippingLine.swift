//
//  WooOrderShippingLine.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A line item on an order used to represent shipping information.
public class WooOrderShippingLine: Mappable {
    
    /// Item ID.
    var id: WooID?
    
    /// Shipping method name.
    var methodTitle: String?
    
    /// Shipping method ID.
    var methodID: String?
    
    /// Line total (after discounts).
    var total: String?
    
    /// Line total tax (after discounts).
    var totalTax: String?
    
    /// Line taxes. See Order - Taxes properties
    var taxes: [WooOrderTaxLine]?
    
    /// Meta data. See Order - Meta data properties
    var metaData: [WooMetaData]?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        methodTitle <- map["method_title"]
        methodID <- map["method_id"]
        total <- map["total"]
        totalTax <- map["total_tax"]
        taxes <- map["taxes"]
        metaData <- map["meta_data"]
    }
}
