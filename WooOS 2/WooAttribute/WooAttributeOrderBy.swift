//
//  WooAttributeOrderBy.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Defines the order in which to display Product Attributes.
///
/// - menuOrder: Order by defined menu order
/// - name: Order by attribute name.
/// - nameNumber: Order by name number.
/// - id: Order by the attribute ID.
public enum WooAttributeOrderBy: String {
    case menuOrder = "menu_order"
    case name = "name"
    case nameNumber = "name_num"
    case id = "id"
}
