//
//  WooOrderRefund.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// An object representing a WooRefund object associated to an order.
public class WooOrderRefund: Mappable {
    
    /// Refund ID.
    var id: WooID?
    
    /// Refund reason.
    var reason: String?
    
    /// Refund total.
    var total: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        reason <- map["reason"]
        total <- map["total"]
    }
}
