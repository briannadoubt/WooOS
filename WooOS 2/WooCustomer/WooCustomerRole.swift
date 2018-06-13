//
//  WooCustomerRole.swift
//  WooOS-iOS
//
//  Created by Brie on 6/9/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

/// Limit result set to resources with a specific role.
///
/// - all: Grants all priviledges
/// - editor: Grants ability to edit pages and products.
/// - author: Allows for authoring pages.
/// - contributor: Allows user to contribute to existing pages.
/// - subscriber: Default WordPress user role.
/// - customer: Default WooCommerce user role.
/// - shopManager: Allows user to edit products, inventory and orders.
public enum WooCustomerRole: String {
    case all = "all"
    case editor = "editor"
    case author = "author"
    case contributor = "contributor"
    case subscriber = "subscriber"
    case customer = "customer"
    case shopManager = "shop_manager"
}
