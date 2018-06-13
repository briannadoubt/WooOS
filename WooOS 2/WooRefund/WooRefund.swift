//
//  WooRefund.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The refund object generated when an order is refunded.
open class WooRefund: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// The date the order refund was created, in the site’s timezone.
    public var dateCreated: Date?
    
    /// The date the order refund was created, as GMT.
    public var dateCreatedGMT: Date?
    
    /// Refund amount.
    public var amount: Float?
    
    /// Reason for refund.
    public var reason: String?
    
    /// User ID of user who created the refund.
    public var refundedBy: Int?
    
    /// Meta data. See Order refund - Meta data properties
    public var metaData: [WooMetaData]?
    
    /// Line items data. See Order refund - Line items properties
    public var lineItems: [WooOrderLineItem]?
    
    /// When true, the payment gateway API is used to generate the refund. Default is true.
    public var apiRefund: Bool?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        amount <- map["amount"]
        reason <- map["reason"]
        refundedBy <- map["refunded_by"]
        metaData <- map["meta_data"]
        lineItems <- map["line_items"]
        apiRefund <- map["api_refund"]
    }
}
