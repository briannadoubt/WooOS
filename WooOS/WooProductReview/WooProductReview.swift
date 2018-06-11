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
    public var id: WooID?
    
    /// The content of the review.
    public var review: String?
    
    /// The date the review was created, in the site’s timezone.
    public var dateCreated: Date?
    
    /// The date the review was created, as GMT.
    public var dateCreatedGMT: Date?
    
    /// Review rating (0 to 5).
    public var rating: Int?
    
    /// Reviewer name.
    public var name: String?
    
    /// Reviewer email.
    public var email: String?
    
    /// Shows if the reviewer bought the product or not.
    public var verified: Bool?
    
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
    public static func listFrom<T: WooProductReview>(product: WooID,
                                          with parameters: [WooProductVariationRequestParameter]? = nil,
                                          then complete: WooCompletion.List<T>? = nil) {
        WooOS.main.api.getList(of: .reviews(product: product, parameters: parameters), then: complete)
    }
}
