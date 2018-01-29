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

class WooDeepLink {
    
    var recognizer = DeepLinkRecognizer(deepLinkTypes: [ProductDeepLink.self])
    
    struct ProductDeepLink: DeepLink {
        
        let productName: String
        let id: String
        
        init(values: DeepLinkValues) {
            id = values.path["id"] as! String
            productName = values.path["productName"] as! String
        }
        
        static let template = DeepLinkTemplate()
            .term("shop")
            .string(named: "productName")
            .string(named: "id")
    }
}

