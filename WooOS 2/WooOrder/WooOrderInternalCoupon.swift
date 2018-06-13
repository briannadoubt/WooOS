//
//  WooOrderCoupon.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// An object representing a WooCoupon object associated with an order.
public class WooOrderInternalCoupon: Mappable {
    
    /// Item ID.
    public var id: WooID?
    
    /// Fee name.
    public var code: String?
    
    /// Tax class of fee.
    public var discount: String?
    
    /// Tax status of fee. Options: taxable and none.
    public var discountTax: WooOrderTaxable?
    
    /// Meta data. See Order - Meta data properties
    public var metaData: [WooMetaData]?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        discount <- map["discount"]
        discountTax <- map["discount_tax"]
        metaData <- map["meta_data"]
    }
}
