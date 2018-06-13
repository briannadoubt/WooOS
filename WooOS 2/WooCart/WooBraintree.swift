//
//  WooBraintree.swift
//  WooOS-iOS
//
//  Created by Brie on 6/10/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import ObjectMapper
import BraintreeDropIn

public class WooBraintree {
    
    static let tokenPath = "wp-json/woo-os/v1/braintree/token"
    static let noncePath = "wp-json/woo-os/v1/braintree/payment"
    
    func showDropIn(on viewController: UIViewController, with token: String, then complete: BTDropInControllerHandler? = nil) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: token, request: request, handler: complete)
        viewController.present(dropIn!, animated: true, completion: nil)
    }
    
    func fetchToken(_ viewController: UIViewController, then complete: BTDropInControllerHandler? = nil) {
        guard let url = URL(string: WooBraintree.tokenPath) else {
            return
        }
        WooOS.main.api.alamofireManager.request(url).responseJSON { jsonResponse in
            guard
                jsonResponse.result.isSuccess,
                let json = jsonResponse.value as? [String: Any],
                let token = json["token"] as? String
                else {
                    return
            }
            
            self.showDropIn(on: viewController, with: token, then: complete)
        }
    }
    
    func postTransaction(_ transaction: WooBraintreeTransaction, then complete: WooCompletion.Success? = nil) {
        
        guard let url = URL(string: WooBraintree.noncePath) else {
            return
        }
        WooOS.main.api.alamofireManager.request(url,
                                                method: .post,
                                                parameters: transaction.toJSON(),
                                                encoding: JSONEncoding.default,
                                                headers: nil)
            .responseJSON { (jsonResponse) in
                
        }
    }
    
}

public class WooBraintreeTransaction: Mappable {
    
    public var amount: String?
    public var orderID: String?
    public var paymentMethodNonce: String?
    public var customer: WooBraintreeCustomer?
    public var billing: WooBraintreeAddress?
    public var shipping: WooBraintreeAddress?
    public var options: WooBraintreeOptions?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        amount <- map["amount"]
        orderID <- map["orderId"]
        paymentMethodNonce <- map["paymentMethodNonce"]
        customer <- map["customer"]
        billing <- map["billing"]
        shipping <- map["shipping"]
        options <- map["options"]
    }
}

public class WooBraintreeCustomer: Mappable {
    public var company: String?
    public var email: String?
    public var fax: String?
    public var firstName: String?
    public var id: String?
    public var lastName: String?
    public var phone: String?
    public var website: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        company <- map["company"]
        email <- map["email"]
        fax <- map["fax"]
        firstName <- map["firstName"]
        id <- map["id"]
        lastName <- map["lastName"]
        phone <- map["phone"]
        website <- map["website"]
    }
}

public class WooBraintreeAddress: Mappable {
    public var company: String?
    public var countryCodeAlpha2: String?
    public var countryCodeAlpha3: String?
    public var countryCodeNumeric: String?
    public var countryName: String?
    public var extendedAddress: String?
    public var firstName: String?
    public var lastName: String?
    public var locality: String?
    public var postalCode: String?
    public var region: String?
    public var streetAddress: String?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        company <- map["company"]
        countryCodeAlpha2 <- map["countryCodeAlpha2"]
        countryCodeAlpha3 <- map["countryCodeAlpha3"]
        countryCodeNumeric <- map["countryCodeNumeric"]
        countryName <- map["countryName"]
        extendedAddress <- map["extendedAddress"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        locality <- map["locality"]
        postalCode <- map["postalCode"]
        region <- map["region"]
        streetAddress <- map["streetAddress"]
    }
}

public class WooBraintreeOptions: Mappable {
    public var storeInVaultOnSuccess: Bool?
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        storeInVaultOnSuccess <- map["storeInVaultOnSuccess"]
    }
}
