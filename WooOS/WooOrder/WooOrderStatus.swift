//
//  WooOrderStatus.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The status of an order.
///
/// - pending: Order is currently pending.
/// - processing: Order is currently processing.
/// - onHold: Order is currently on hold.
/// - completed: Order has been completed.
/// - cancelled: Order was cancelled.
/// - refunded: Order has been successfully refunded.
/// - failed: Order has failed.
public enum WooOrderStatus: String {
    case pending = "pending"
    case processing = "processing"
    case onHold = "on-hold"
    case completed = "completed"
    case cancelled = "cancelled"
    case refunded = "refunded"
    case failed = "failed"
}
