//
//  Float+Extension.swift
//  WooOS-iOS
//
//  Created by Brie on 6/9/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

extension Float {
    public var string: String {
        let string = String(format: "$%.02f", self)
        return string
    }
}
