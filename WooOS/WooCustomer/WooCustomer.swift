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
    var id: WooID?
    
    /// The date the customer was created, in the site’s timezone.
    var dateCreated: Date?
    
    /// The date the order was created, as GMT.
    var dateCreatedGMT: Date?
    
    /// The date the customer was last modified, in the site’s timezone.
    var dateModified: Date?
    
    /// The date the customer was last modified, as GMT.
    var dateModifiedGMT: Date?
    
    /// The email address for the customer.
    var email: String?
    
    /// Customer first name.
    var firstName: String?
    
    /// Customer last name.
    var lastName: String?
    
    /// Customer role.
    var role: String?
    
    /// Customer login name.
    var username: String?
    
    /// Customer password.
    var password: String? {
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
    var billing: WooBilling?
    
    /// List of shipping address data. See Customer - Shipping properties
    var shipping: WooShipping?
    
    /// Is the customer a paying customer?
    var isPayingCustomer: Bool?
    
    /// Quantity of orders made by the customer.
    var ordersCount: Int?
    
    /// Total amount spent.
    var totalSpent: String?
    
    /// Avatar URL.
    var avatarURL: URL?
    
    /// Meta data. See Customer - Meta data properties
    var metaData: [WooMetaData]?
    
    init() { }
    
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
    
    func get<T: WooCustomer>(customer: WooID,
                             then complete: WooCompletion.Object<T>?) {
        WooOS.main.api.getObject(type: WooRequestConvertible.customer(id: customer), then: complete)
    }
}


