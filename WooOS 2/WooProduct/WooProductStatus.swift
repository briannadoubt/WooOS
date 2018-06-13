//
//  WooProductStatus.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The current status of a product
///
/// - draft: The post is only a draft, and is not visible to the public.
/// - pending: The post has been submitted for publishing, and is pending approval from an Admin.
/// - `private`: The product is published as private, and only visible to the author and Admins.
public enum WooProductStatus: String {
    case publish = "publish"
    case draft = "draft"
    case pending = "pending"
    case `private` = "private"
}
