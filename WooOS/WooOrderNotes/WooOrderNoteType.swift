//
//  WooOrderNoteType.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Limit result to customers or internal notes.
///
/// - any: All notes of any type.
/// - customer: Only customer notes.
/// - internalNote: Only internal notes.
enum WooOrderNoteType: String {
    case any = "any"
    case customer = "customer"
    case internalNote = "internal"
}
