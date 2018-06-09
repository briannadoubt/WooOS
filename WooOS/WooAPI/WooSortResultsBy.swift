//
//  WooOrderBy.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// Determines in which order the orders are displayed.
///
/// - id: Sort in order of the ID
/// - include: Sort by which items were included.
/// - name: Sort by the names of the items.
/// - slug: Sort by the slugs of the items.
/// - termGroup: Sort by the term group of the items.
/// - description: Sort by the description of the items.
/// - count: Sort by count.
public enum WooSortResultsBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}
