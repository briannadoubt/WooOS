//
//  WooOrderLineItem.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooOrderLineItem: Mappable {
    
    /// Item ID.
    var id: WooID?
    
    /// Product name.
    var name: String?
    
    /// Product ID.
    var productID: WooID?
    
    /// Variation ID, if applicable.
    var variationID: WooID?
    
    /// Quantity ordered.
    var quantity: Int?
    
    /// Tax class of product.
    var taxClass: Int?
    
    /// Line subtotal (before discounts).
    var subtotal: String?
    
    /// Line subtotal tax (before discounts).
    var subtotalTax: String?
    
    /// Line total (after discounts).
    var total: String?
    
    /// Line total tax (after discounts).
    var totalTax: String?
    
    /// Line taxes. See Order - Taxes properties
    var taxes: [WooOrderTaxLine]?
    
    /// Meta data. See Order - Meta data properties
    var metaData: [WooMetaData]?
    
    /// Product SKU.
    var sku: String?
    
    /// Product price.
    var price: String?
    
    /// Initialize with the minimum parameters to `POST` a new lineItem to the order.
    ///
    /// - Parameters:
    ///   - product: The id of the product in the cart.
    ///   - variation: The optional variation id of the product of the line item.
    ///   - quantity: The quantity of the items being ordered.
    init(from product: WooID, variation: WooID? = nil, quantity: Int) {
        productID = product
        variationID = variation
    }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        productID <- map["product_id"]
        variationID <- map["variation_id"]
        quantity <- map["quantity"]
        taxClass <- map["tax_class"]
        subtotal <- map["subtotal"]
        subtotalTax <- map["subtotal_tax"]
        total <- map["total"]
        totalTax <- map["total_tax"]
        taxes <- map["taxes"]
        metaData <- map["meta_data"]
        sku <- map["sku"]
        price <- map["price"]
    }
}
