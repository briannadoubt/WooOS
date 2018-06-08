//
//  WooOrderStatus.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// <#Description#>
///
/// - pending: <#pending description#>
/// - processing: <#processing description#>
/// - onHold: <#onHold description#>
/// - completed: <#completed description#>
/// - cancelled: <#cancelled description#>
/// - refunded: <#refunded description#>
/// - failed: <#failed description#>
enum WooOrderStatus: String {
    case pending = "pending"
    case processing = "processing"
    case onHold = "on-hold"
    case completed = "completed"
    case cancelled = "cancelled"
    case refunded = "refunded"
    case failed = "failed"
}
