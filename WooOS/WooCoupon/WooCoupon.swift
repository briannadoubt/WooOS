//
//  WooCoupon.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/2/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// <#Description#>
public class WooCoupon: Mappable {
    
    /// Unique identifier for the object.
    var id: WooID?
    
    /// Coupon code.
    var code: String?
    
    /// The amount of discount. Should always be numeric, even if setting a percentage.
    var amount: String?
    
    /// The date the coupon was created, in the site’s timezone.
    var dateCreated: Date?
    
    /// The date the coupon was created, as GMT.
    var dateCreatedGMT: Date?
    
    /// The date the coupon was last modified, in the site’s timezone.
    var dateModified: Date?
    
    /// The date the coupon was last modified, as GMT.
    var dateModifiedGMT: Date?
    
    /// Determines the type of discount that will be applied. Options: percent, fixed_cart and fixed_product. Default is fixed_cart.
    var discountType: WooCouponDiscountType? = .fixedCart
    
    /// Coupon description.
    var description: String?
    
    /// The date the coupon expires, in the site’s timezone.
    var dateExpires: Date?
    
    /// The date the coupon expires, as GMT.
    var dateExpiresGMT: Date?
    
    /// Number of times the coupon has been used already.
    var usageCount: WooID?
    
    /// If true, the coupon can only be used individually. Other applied coupons will be removed from the cart. Default is false.
    var individualUse: Bool?
    
    /// List of product IDs the coupon can be used on.
    var productIDs: [WooID]?
    
    /// List of product IDs the coupon cannot be used on.
    var excludeProductIDs: [WooID]?
    
    /// How many times the coupon can be used in total.
    var usageLimit: WooID?
    
    /// How many times the coupon can be used per customer.
    var usageLimitPerUser: WooID?
    
    /// Max number of items in the cart the coupon can be applied to.
    var limitUsageToXItems: WooID?
    
    /// If true and if the free shipping method requires a coupon, this coupon will enable free shipping. Default is false.
    var freeShipping: Bool? = false
    
    /// List of category IDs the coupon applies to.
    var productCategories: [WooID]?
    
    /// List of category IDs the coupon does not apply to.
    var excludedProductCategories: [WooID]?
    
    /// If true, this coupon will not be applied to items that have sale prices. Default is false.
    var excludeSaleItems: Bool?
    
    /// Minimum order amount that needs to be in the cart before coupon applies.
    var minimumAmount: Float?
    
    /// Maximum order amount allowed when using the coupon.
    var maximumAmount: Float?
    
    /// List of email addresses that can use this coupon.
    var emailRestrictions: [String]?
    
    /// List of user IDs (or guest email addresses) that have used the coupon.
    var usedBy: [WooID]?
    
    /// Meta data. See Coupon - Meta data properties
    var metaData: [WooMetaData]?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        amount <- map["amount"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        dateModified <- map["date_modified"]
        dateModifiedGMT <- map["date_modified_gmt"]
        discountType <- map["discount_type"]
        description <- map["description"]
        dateExpires <- map["date_expires"]
        dateExpiresGMT <- map["date_expires_gmt"]
        usageCount <- map["usage_count"]
        individualUse <- map["individual_use"]
        productIDs <- map["product_ids"]
        excludeProductIDs <- map["excluded_product_ids"]
        usageLimit <- map["usage_limit"]
        usageLimitPerUser <- map["usage_limit_per_user"]
        limitUsageToXItems <- map["limit_usage_to_x_items"]
        freeShipping <- map["free_shipping"]
        productCategories <- map["product_categories"]
        excludedProductCategories <- map["excluded_product_categories"]
        excludeSaleItems <- map["exclude_sale_items"]
        minimumAmount <- map["minimum_amount"]
        maximumAmount <- map["maximum_amount"]
        emailRestrictions <- map["email_restrictions"]
        usedBy <- map["used_by"]
        metaData <- map["meta_data"]
    }
}
