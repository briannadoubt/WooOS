//
//  WooCouponOrderBy.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/3/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The object that defines how the coupon request should be ordered.
///
/// - date: Sort coupons by date
/// - id: Sort coupons by id
/// - include: Sort by which coupons that are to be indluded
/// - title: Sort coupons by title
/// - slug: Sort coupons by slug.
public enum WooCouponOrderBy: String {
    case date = "date"
    case id = "id"
    case include = "include"
    case title = "title"
    case slug = "slug"
}
