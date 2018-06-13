//
//  WooDeepLink.swift
//  Art On T-Shirt
//
//  Created by brianna on 11/25/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation

// ------------------------------------------------------------------------
// MARK: - WooDeepLink
// ------------------------------------------------------------------------

/// The object used to represent a DeepLink action to a page in WooOS
public class WooDeepLink {
    
    /// The recognizer used to recognize product deep link.
    public var productRecognizer = DeepLinkRecognizer(deepLinkTypes: [ProductDeepLink.self])
    
    /// The deep link object used to link to a product.
    public struct ProductDeepLink: DeepLink {
        
        let productName: String
        let id: WooID
        
        public init(values: DeepLinkValues) {
            id = values.path["id"] as! WooID
            productName = values.path["productName"] as! String
        }
        
        public static let template = DeepLinkTemplate()
            .term("shop")
            .string(named: "productName")
            .string(named: "id")
    }
}

