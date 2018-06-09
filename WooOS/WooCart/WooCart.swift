    //
//  WooCart.swift
//  Art On T-Shirt
//
//  Created by brianna on 12/13/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation
import Alamofire

public enum WooCartState: String {
    case shopping = "shopping"
    case checkout = "checkoutInProgress"
}

/// Singleton class designed to manage the client-side cart features of WooOS.
public class WooCart {
    
    /// The current state of the cart in the checkout process.
    var state: WooCartState = .shopping
    
    /// Products currently in the cart
    var products: [WooProduct] = []
    
    /// The order that is currently being built by the current cart.
    var order: WooOrder!
    
    init() {
        order = WooOrder()
        // TODO: Check WooCommerce for active cart.
    }
    
    /// Check each attribute to assure that they each have a selected option.
    ///
    /// - Returns: WooAttribute if this attribute has not been selected by user.
    class func firstUnselectedAttribute(in product: WooProduct) -> WooAttribute? {
        // If there are attributes available for this product, check to make sure they are selected.
        guard
            // Unwrap attributes
            let attributes = product.attributes,
            
            // Assure there are attributes associated to the product
            attributes.count > 0  else {
            
            return nil
        }
        
        // Check each attribute for its name and selectedOption
        for attribute in attributes {
            guard
                // Unwrap attribute's name
                attribute.name != nil,
                
                // Confirm selected option is not nil
                attribute.selectedOption != nil
                
                // Handle errors
                else {
                    // Next Attribute
                    return attribute
            }
        }
        
        return nil
    }
    
    /// Adds a product to the cart
    ///
    /// - Parameters:
    ///   - product: The product to add to the cart.
    ///   - complete: Optional completion containing a success flag and an error string if success is false.
    func add(quantity: Int,
             product: WooProduct,
             with variation: WooProductVariation? = nil,
             then complete: WooCompletion.Success? = nil) {
        
        if let unselectedAttribute = WooCart.firstUnselectedAttribute(in: product) {
            complete?(false, WooError.attributeNotSelected(attributeType: unselectedAttribute.name ?? "Unknown Attribute"))
            return
        }
        
        // Add product to current products in memory
        products.append(product)
        
        // Unwrap product id for line item.
        guard let productID = product.id else {
            // Complete with error
            complete?(false, WooError.noProductID(description: "Product ID while adding to line item was not found!"))
            return
        }
        
        // Create line item to append.
        let lineItem = WooOrderLineItem(from: productID, variation: variation?.id, quantity: quantity)
        
        // Append line item to current order.
        order.lineItems?.append(lineItem)
        
        // Complete
        complete?(true, nil)
    }
    
    func changeState(to newState: WooCartState) {
        
        self.state = newState
        
        switch newState {
        case .shopping:
            return
        case .checkout:
            return
        }
    }
}
