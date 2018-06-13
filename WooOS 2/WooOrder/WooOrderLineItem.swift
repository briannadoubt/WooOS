//
//  WooOrderLineItem.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A line item representing a product or product variation on an order.
public class WooOrderLineItem: Mappable {
    
    /// Item ID.
    public var id: WooID?
    
    /// Product name.
    public var name: String?
    
    /// Product ID.
    public var productID: WooID?
    
    /// Variation ID, if applicable.
    public var variationID: WooID?
    
    /// Quantity ordered.
    public var quantity: Int?
    
    /// Tax class of product.
    public var taxClass: Int?
    
    /// Line subtotal (before discounts).
    public var subtotal: String?
    
    /// Line subtotal tax (before discounts).
    public var subtotalTax: String?
    
    /// Line total (after discounts).
    public var total: String?
    
    /// Line total tax (after discounts).
    public var totalTax: String?
    
    /// Line taxes. See Order - Taxes properties
    public var taxes: [WooOrderTaxLine]?
    
    /// Meta data. See Order - Meta data properties
    public var metaData: [WooMetaData]?
    
    /// Product SKU.
    public var sku: String?
    
    /// Product price.
    public var price: String?
    
    /// Initialize with the minimum parameters to `POST` a new lineItem to the order.
    ///
    /// - Parameters:
    ///   - product: The id of the product in the cart.
    ///   - variation: The optional variation id of the product of the line item.
    ///   - quantity: The quantity of the items being ordered.
    public init(from product: WooID, variation: WooID? = nil, quantity: Int) {
        productID = product
        variationID = variation
        self.quantity = quantity
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
