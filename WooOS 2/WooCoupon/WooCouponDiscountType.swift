//
//  WooCouponDiscountType.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/2/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The type of discount being applied with the coupon.
///
/// - percent: This coupon should use a percentage discount on the cart total.
/// - fixedCart: This coupon should apply a fixed discount to the cart total.
/// - fixedProduct: This coupon should apply a fixed discount to a product in the cart.
public enum WooCouponDiscountType: String {
    case percent = "percent"
    case fixedCart = "fixed_cart"
    case fixedProduct = "fixed_product"
}
