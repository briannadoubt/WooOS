//
//  WooBackorder.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The status of the product's backorder
///
/// - no: Indicates there is no backorder
/// - notify: Indicates if the customer is to be notified when the product comes back into stock.
/// - yes: Indicates the product is currently backordered.
public enum WooBackorder: String {
    case no = "no"
    case notify = "notify"
    case yes = "yes"
}
