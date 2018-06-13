//
//  WooShipping.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

/// The shipping object for an order.
public class WooShipping: Mappable {
    
    /// First name.
    public var firstName: String?
    
    /// Last name.
    public var lastName: String?
    
    /// Company name.
    public var company: String?
    
    /// Address line 1
    public var address1: String?
    
    /// Address line 2
    public var address2: String?
    
    /// City name.
    public var city: String?
    
    /// ISO code or name of the state, province or district.
    public var state: String?
    
    /// Postal code.
    public var postcode: String?
    
    /// Country code in ISO 3166-1 alpha-2 format.
    public var country: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        company <- map["company"]
        address1 <- map["address_1"]
        address2 <- map["address_2"]
        city <- map["city"]
        state <- map["state"]
        postcode <- map["postcode"]
        country <- map["country"]
    }
}
