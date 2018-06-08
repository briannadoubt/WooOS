//
//  WooAttributeType.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Defines the type of the product attribute.
///
/// - select: Defines whether the attribute has been selected or not.
/// - text: Shows the text of the selected attribute.
public enum WooAttributeType: String {
    case select = "select"
    case text = "text"
}
