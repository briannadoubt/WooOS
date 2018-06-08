//
//  WooNonce.swift
//  Eightfold
//
//  Created by Brianna Lee on 5/7/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

class WooNonce: ImmutableMappable {
    
    var status: String
    var controller: String
    var method: String
    var nonce: String
    
    required init(map: Map) throws {
        status = try map.value("status")
        controller = try map.value("controller")
        method = try map.value("method")
        nonce = try map.value("nonce")
    }
}
