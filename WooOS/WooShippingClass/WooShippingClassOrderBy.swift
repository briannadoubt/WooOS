//
//  WooShippingClassOrderBy.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/4/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The order in which to download the requested WooProductShippingClass objects.
///
/// - id: Order by shipping class ID.
/// - include: Order by which items were to be included.
/// - name: Order by name.
/// - slug: Order by slug.
/// - termGroup: Order by the shipping class term groups.
/// - description: Order by the description.
/// - count: Order by the count of classes.
enum WooShippingClassOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}
