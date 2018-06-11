//
//  WooProductReview.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/4/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

open class WooProductReview: Mappable {
    
    /// Unique identifier for the resource.
    var id: WooID?
    
    /// The content of the review.
    var review: String?
    
    /// The date the review was created, in the site’s timezone.
    var dateCreated: Date?
    
    /// The date the review was created, as GMT.
    var dateCreatedGMT: Date?
    
    /// Review rating (0 to 5).
    var rating: Int?
    
    /// Reviewer name.
    var name: String?
    
    /// Reviewer email.
    var email: String?
    
    /// Shows if the reviewer bought the product or not.
    var verified: Bool?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        review <- map["review"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        rating <- map["rating"]
        name <- map["name"]
        email <- map["email"]
        verified <- map["verified"]
    }
    
    /// Download a list of reviews with the specified parameters.
    ///
    /// - Parameters:
    ///   - parameters: The reviews request parameters defining which reviews to download.
    ///   - complete: Asynchronous completion containing a success flag, the list of reviews, and an optional error.
    static func listFrom<T: WooProductReview>(product: WooID,
                                          with parameters: [WooProductVariationRequestParameter]? = nil,
                                          then complete: WooCompletion.List<T>? = nil) {
        WooOS.main.api.getList(of: .reviews(product: product, parameters: parameters), then: complete)
    }
}
