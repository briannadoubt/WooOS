//
//  WooCustomer.swift
//  Eightfold
//
//  Created by Brianna Lee on 3/1/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper
import Locksmith

/// Object representing a customer stored on WooCommerce.
open class WooCustomer: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// The date the customer was created, in the site’s timezone.
    public var dateCreated: Date?
    
    /// The date the order was created, as GMT.
    public var dateCreatedGMT: Date?
    
    /// The date the customer was last modified, in the site’s timezone.
    public var dateModified: Date?
    
    /// The date the customer was last modified, as GMT.
    public var dateModifiedGMT: Date?
    
    /// The email address for the customer.
    public var email: String?
    
    /// Customer first name.
    public var firstName: String?
    
    /// Customer last name.
    public var lastName: String?
    
    /// Customer role.
    public var role: String?
    
    /// Customer login name.
    public var username: String?
    
    /// Customer password.
    public var password: String? {
        get {
            guard
                let username = WooOS.main.currentCustomer?.username,
                let keychainDict = Locksmith.loadDataForUserAccount(userAccount: username, inService:  WooAPI.keychainService),
                let token = keychainDict["password"] as? String
                else {
                    return nil
            }
            return token
        }
        
        set {
            do {
                guard
                    let newPassword = newValue,
                    let username = WooOS.main.currentCustomer?.username
                    else {
                        return
                }
                
                try Locksmith.saveData(data: ["password": newPassword], forUserAccount: username, inService: WooAPI.keychainService)
                
            } catch {
                print(error)
            }
        }
    }
    
    /// List of billing address data. See Customer - Billing properties
    public var billing: WooBilling?
    
    /// List of shipping address data. See Customer - Shipping properties
    public var shipping: WooShipping?
    
    /// Is the customer a paying customer?
    public var isPayingCustomer: Bool?
    
    /// Quantity of orders made by the customer.
    public var ordersCount: Int?
    
    /// Total amount spent.
    public var totalSpent: String?
    
    /// Avatar URL.
    public var avatarURL: URL?
    
    /// Meta data. See Customer - Meta data properties
    public var metaData: [WooMetaData]?
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        dateModified <- map["date_modified"]
        dateModifiedGMT <- map["date_modified_gmt"]
        email <- map["email"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        role <- map["role"]
        username <- map["username"]
        password <- map["password"]
        billing <- map["billing"]
        shipping <- map["shipping"]
        isPayingCustomer <- map["is_paying_customer"]
        ordersCount <- map["orders_count"]
        totalSpent <- map["total_spent"]
        avatarURL <- map["avatar_url"]
        metaData <- map["meta_data"]
    }
    
    public func get<T: WooCustomer>(customer: WooID,
                             then complete: WooCompletion.Object<T>?) {
        WooOS.main.api.getObject(type: WooRequestConvertible.customer(id: customer), then: complete)
    }
}


