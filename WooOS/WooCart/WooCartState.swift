//
//  WooCartState.swift
//  WooOS-iOS
//
//  Created by Brie on 6/10/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

/// The current state of the cart.
///
/// - shopping: Customer is still currently shopping.
/// - checkout: Customer has 
public enum WooCartState: String {
    case shopping = "shopping"
    case checkout = "checkoutInProgress"
}
