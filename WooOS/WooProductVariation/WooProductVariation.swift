//
//  WooProductVariation.swift
//  Art On T-Shirt
//
//  Created by brianna on 12/17/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation
import ObjectMapper

/// A variation of a product.
public class WooProductVariation: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// The date the variation was created, in the site’s timezone.
    var dateCreated: Date?
    
    /// The date the variation was last modified, in the site’s timezone.
    var dateModified: Date?
    
    /// Variation description.
    var productDescription: String?
    
    /// Variation URL.
    var permalink: URL?
    
    /// Unique identifier.
    var sku: String?
    
    /// Current variation price.
    var price: Float?
    
    /// Variation regular price.
    var regularPrice: Float?
    
    /// Variation sale price.
    var salePrice: Float?
    
    /// Start date of sale price, in the site’s timezone.
    var dateOnSaleFrom: Date?
    
    /// Start date of sale price, as GMT.
    var dateOnSaleFromGMT: Date?
    
    /// End date of sale price, in the site’s timezone.
    var dateOnSaleTo: Date?
    
    /// End date of sale price, in the site’s timezone.
    var dateOnSaleToGMT: Date?
    
    /// Shows if the variation is on sale.
    var onSale: Bool?
    
    /// Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is true.
    var visible: Bool? = true
    
    /// Shows if the variation can be bought.
    var purchasable: Bool?
    
    /// If the variation is virtual. Default is false.
    var virtual: Bool? = false
    
    /// If the variation is downloadable. Default is false.
    var downloadable: Bool? = false
    
    /// List of downloadable files. See ProductVariationDownload properties
    var downloads: [WooDownload]?
    
    /// Number of times downloadable files can be downloaded after purchase. Default is -1.
    var downloadLimit: Int? = -1
    
    /// Number of days until access to downloadable files expires. Default is -1.
    var downloadExiry: Int? = -1
    
    /// Tax status. Options: taxable, shipping and none. Default is taxable.
    var taxStatus: WooTaxStatus? = WooTaxStatus.taxable
    
    /// Tax class.
    var taxClass: String?
    
    /// Stock management at variation level. Default is false.
    var manageStock: Bool? = false
    
    /// Stock quantity.
    var stockQuantity: Int?
    
    /// Controls whether or not the variation is listed as “in stock” or “out of stock” on the frontend. Default is true.
    var inStock: Bool? = true
    
    /// If managing stock, this controls if backorders are allowed. Options: no, notify and yes. Default is no.
    var backorders: WooBackorder? = .no
    
    /// Shows if backorders are allowed.
    var backOrdersAllowed: Bool?
    
    /// Shows if the variation is on backordered.
    var backordered: Bool?
    
    /// Variation weight.
    var weight: String?
    
    /// Variation dimensions. See ProductVariationDimensions properties.
    var dimensions: WooDimensions?
    
    /// Shipping class slug.
    var shippingClass: String?
    
    /// Shipping class ID.
    var shippingClassID: WooID?
    
    /// Variation image data. See ProductVariationImage properties.
    var image: WooImage?
    
    /// List of attributes. See ProductVariationAttribute properties
    var attributes: [WooAttribute]?
    
    /// Menu order, used to custom sort products.
    var menuOrder: Int?
    
    /// Meta data. See Product variation - Meta data properties
    var metaData: [WooMetaData]?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- (map["date_created"], using: ISO8601DateTransform())
        dateModified <- (map["date_modified"], using: ISO8601DateTransform())
        productDescription <- map["description"]
        permalink <- (map["permalink"], using: URLTransform())
        sku <- map["sku"]
        price <- (map["price"], FloatTransform())
        regularPrice <- (map["regular_price"], FloatTransform())
        salePrice <- (map["sale_price"], FloatTransform())
        dateOnSaleFrom <- (map["date_on_sale_from"], using: ISO8601DateTransform())
        dateOnSaleFromGMT <- (map["date_on_sale_from_gmt"], using: ISO8601DateTransform())
        dateOnSaleTo <- (map["date_on_sale_to"], using: ISO8601DateTransform())
        dateOnSaleToGMT <- (map["date_on_sale_to_gmt"], using: ISO8601DateTransform())
        onSale <- map["on_sale"]
        visible <- map["visible"]
        purchasable <- map["purchasable"]
        virtual <- map["virtual"]
        downloadable <- map["downloadable"]
        downloads <- map["downloads"]
        downloadLimit <- map["download_limit"]
        downloadExiry <- map["download_expiry"]
        taxStatus <- map["tax_status"]
        taxClass <- map["tax_class"]
        manageStock <- map["manage_stock"]
        stockQuantity <- map["stock_quantity"]
        inStock <- map["in_stock"]
        backorders <- map["backorders"]
        backOrdersAllowed <- map["backorders_allowed"]
        backordered <- map["backordered"]
        weight <- map["weight"]
        dimensions <- map["dimensions"]
        shippingClass <- map["shipping_class"]
        shippingClassID <- map["shipping_class_id"]
        image <- map["image"]
        attributes <- map["attributes"]
        menuOrder <- map["menu_order"]
        metaData <- map["meta_data"]
    }
    
    /// List all `ProductVariation` objects associated to a specific product.
    ///
    /// - Parameters:
    ///   - product: The identifier of the parent product from which the variations are born...
    ///   - parameters: Optional parameters to filter variations.
    ///   - complete: Optional completion that includes the relevant `WooProductVariation` objects.
    static func listFrom<T: WooProductVariation>(product: WooID,
                                          with parameters: [WooProductVariationRequestParameter]? = nil,
                                          then complete: WooCompletion.List<T>? = nil) {
        WooOS.main.api.getList(of: .variations(product: product, parameters: parameters), then: complete)
    }
}
