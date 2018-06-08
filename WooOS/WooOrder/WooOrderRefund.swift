//
//  WooOrderRefund.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

class WooOrderRefund: Mappable {
    
    /// Refund ID.
    var id: WooID?
    
    /// Refund reason.
    var reason: String?
    
    /// Refund total.
    var total: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        id <- map["id"]
        reason <- map["reason"]
        total <- map["total"]
    }
}
