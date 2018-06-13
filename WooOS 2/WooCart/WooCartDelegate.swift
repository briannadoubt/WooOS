//
//  WooCartDelegate.swift
//  WooOS-iOS
//
//  Created by Brie on 6/11/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

public protocol WooCartDelegate {
    func did(add product: WooProduct, to cart: WooCart)
    func did(remove product: WooProduct, from cart: WooCart)
    func did(update product: WooProduct, in cart: WooCart)
}
