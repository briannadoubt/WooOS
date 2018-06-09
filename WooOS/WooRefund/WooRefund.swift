//
//  WooRefund.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooRefund: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// The date the order refund was created, in the site’s timezone.
    var dateCreated: Date?
    
    /// The date the order refund was created, as GMT.
    var dateCreatedGMT: Date?
    
    /// Refund amount.
    var amount: Float?
    
    /// Reason for refund.
    var reason: String?
    
    /// User ID of user who created the refund.
    var refundedBy: Int?
    
    /// Meta data. See Order refund - Meta data properties
    var metaData: [WooMetaData]?
    
    /// Line items data. See Order refund - Line items properties
    var lineItems: [WooOrderLineItem]?
    
    /// When true, the payment gateway API is used to generate the refund. Default is true.
    var apiRefund: Bool?
    
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
