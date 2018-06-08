//
//  WooAttributeTermOrderBy.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The order in which to display the product attribute terms.
///
/// - id: Order by ID.
/// - include: Order by whether or not the terms was to be included.
/// - name: Order by name.
/// - slug: Order by slug.
/// - termGroup: Order by term group.
/// - description: Order by description.
/// - count: Order by count.
public enum WooAttributeTermOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}
