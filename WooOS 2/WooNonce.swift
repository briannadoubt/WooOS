//
//  WooNonce.swift
//  Eightfold
//
//  Created by Brianna Lee on 5/7/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooNonce: ImmutableMappable {
    
    public var status: String
    public var controller: String
    public var method: String
    public var nonce: String
    
    required public init(map: Map) throws {
        status = try map.value("status")
        controller = try map.value("controller")
        method = try map.value("method")
        nonce = try map.value("nonce")
    }
}
