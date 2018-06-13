//
//  WooProductOrderBy.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The order in which products should be displayed.
///
/// - date: Order by product's publish date.
/// - id: Order by product ID.
/// - include: Order by which products were specified to be included.
/// - title: Order products by title.
/// - slug: Order products by the product's slug.
public enum WooProductOrderBy: String {
    case date = "date"
    case id = "id"
    case include = "include"
    case title = "title"
    case slug = "slug"
}
