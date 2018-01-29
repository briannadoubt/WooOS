//
//  WooOrderBy.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// <#Description#>
///
/// - id: <#id description#>
/// - include: <#include description#>
/// - name: <#name description#>
/// - slug: <#slug description#>
/// - termGroup: <#termGroup description#>
/// - description: <#description description#>
/// - count: <#count description#>
public enum WooOrderBy: String {
    case id = "id"
    case include = "include"
    case name = "name"
    case slug = "slug"
    case termGroup = "term_group"
    case description = "description"
    case count = "count"
}
