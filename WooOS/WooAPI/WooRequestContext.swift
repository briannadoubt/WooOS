//
//  WooRequestContext.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Defines how the data should be displayed.
///
/// - view: Default view. This is customer facing information.
/// - edit: Admin access only. Used for editing various parts of the store.
public enum WooRequestContext: String {
    case view = "view"
    case edit = "edit"
}
