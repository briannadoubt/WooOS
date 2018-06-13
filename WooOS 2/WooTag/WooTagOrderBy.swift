//
//  WooTagOrderBy.swift
//  WooOS-iOS
//
//  Created by Brie on 6/10/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation

/// Defines the order in which WooTag object are downloaded and displayed from WooCommerce.
///
/// - id: Order by the tag's ID
/// - include: Order by which products to be included.
/// - name: Order by the tag's name. This option is default.
/// - slug: Order by the tag's unique slug.
/// - termGroup: Order by the term group.
/// - description: Order by the tag's description.
/// - count: Order by the count of products with this tag.
public enum WooTagOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}
