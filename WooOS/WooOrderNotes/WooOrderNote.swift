//
//  WooOrderNote.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// A note that is present on an order. These are status updates and some are added automatically
open class WooOrderNote: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// The date the order note was created, in the site’s timezone.
    var dateCreated: String?
    
    /// The date the order note was created, as GMT.
    var dateCreatedGMT: String?
    
    /// Order note content.
    var note: String?
    
    /// If true, the note will be shown to customers and they will be notified. If false, the note will be for admin reference only. Default is false.
    var customerNote: Bool? = false
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        note <- map["note"]
        customerNote <- map["customer_note"]
    }
}
