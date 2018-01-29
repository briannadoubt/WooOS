//
//  WooRequestType.swift
//  Art On T-Shirt
//
//  Created by brianna on 12/17/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation

public enum WooRequestType {
    
    case GetCustomer(Int)
    case CreateOrder
    case UpdateOrder(Int)
    case GetOrder(Int)
    case GetCustomerOrders(Int)
    case GetAllCategories
    case GetProduct(Int)
    case GetAllProducts
    case GetAllProductsInCategory(Int)
    case GetVariationsOfProduct(Int)
    
    var slug: String {
        switch self {
        case .GetCustomer(let id):
            return "customers/\(id)"
        case .CreateOrder:
            return "orders"
        case .UpdateOrder(let id):
            return "orders/\(id)"
        case .GetOrder(let id):
            return "orders/\(id)"
        case .GetCustomerOrders(let id):
            return "customers/\(id)/orders"
        case .GetAllCategories:
            return "products/categories"
        case .GetProduct(let id):
            return "products/\(id)"
        case .GetAllProducts:
            return "products"
        case .GetAllProductsInCategory(let id):
            return "products?category=\(id)?status=publish"
        case .GetVariationsOfProduct(let id):
            return "products/\(id)/variations"
        }
    }
}
