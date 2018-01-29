
import Foundation
import ObjectMapper

public struct WooAddress: Mappable {
    public var firstName: String?
    public var lastName: String?
    public var company: String?
    public var address1: String?
    public var address2: String?
    public var city: String?
    public var state: String?
    public var postcode: String?
    public var country: String?
    public var email: String?
    public var phone: String?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        company <- map["company"]
        address1 <- map["address_1"]
        address2 <- map["address_2"]
        city <- map["city"]
        state <- map["state"]
        postcode <- map["postcode"]
        country <- map["country"]
        email <- map["email"]
        phone <- map["phone"]
    }
}
