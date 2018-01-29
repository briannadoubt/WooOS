import Foundation
import ObjectMapper

public class WooCustomer: Mappable {
    public var id: Int?
    public var createdAt: Date?
    public var email: String?
    public var firstName: String?
    public var lastName: String?
    public var username: String?
    public var password: String?
    public var lastOrderId: Int?
    public var lastOrderDate: Date?
    public var ordersCount: Int?
    public var totalSpent: Int?
    public var avatarUrl: URL?
    public var billingAddress: WooAddress?
    public var shippingAddress: WooAddress?

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        id <- map["id"]
        createdAt <- (map["created_at"], using: ISO8601DateTransform())
        email <- map["email"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        username <- map["username"]
        password <- map["password"]
        lastOrderId <- map["last_order_id"]
        lastOrderDate <- (map["last_order_date"], using: ISO8601DateTransform())
        ordersCount <- map["orders_count"]
        totalSpent <- map["total_spent"]
        avatarUrl <- (map["avatar_url"], using: URLTransform())
        billingAddress <- map["billing_address"]
        shippingAddress <- map["shipping_address"]
    }

    public static func get<T: Mappable>(id: Int, complete: @escaping WooCompletion.Object<T>) {
        WooOS.main.api.getObject(type: .GetCustomer(id), then: complete)
    }

    public static func getOrders<T: Mappable>(of customer: WooCustomer, complete: @escaping WooCompletion.Array<T>) {
        guard let customerID = customer.id else {
            complete(false, nil, "Customer ID is nil.")
            return
        }
        let parameters = WooRequestParameters.Array(type: .GetCustomerOrders(customerID), limit: 50)
        WooOS.main.api.getList(with: parameters, then: complete)
    }
}
