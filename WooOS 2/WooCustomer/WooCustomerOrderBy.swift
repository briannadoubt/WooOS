//
//  WooCustomerOrderBy.swift
//  WooOS-iOS
//
//  Created by Brie on 6/9/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

/// Sort collection by WooCustomer attribute.
///
/// - id: The ID of the WooCustomer.
/// - include: Which customers to include.
/// - name: Order by name.
/// - registeredDate: Order by date registered.
public enum WooCustomerOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case registeredDate = "registered_date"
}
