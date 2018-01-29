import Foundation
import ObjectMapper

public struct WooOrder: Mappable {
    public var id: Int?
    public var orderNumber: Int?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var completedAt: Date?
    public var status: String?
    public var currency: String?
    public var total: Float?
    public var subtotal: Float?
    public var totalLineItemQuantity: Int?
    public var totalTax: Float?
    public var totalShipping: Float?
    public var cartTax: Float?
    public var shippingTax: Float?
    public var totalDiscount: Float?
    public var shippingMethods: String?
    public var paymentDetails: WooPaymentDetails?
    public var billingAddress: WooAddress?
    public var shippingAddress: WooAddress?
    public var note: String?
    public var customerIp: String?
    public var customerUserAgent: String?
    public var customerId: Int?
    public var viewOrderUrl: URL?
    public var lineItems: [WooLineItem]?
    public var shippingLines: String?
    public var taxLines: String?
    public var feeLines: String?
    public var couponLines: String?
    public var customer: WooCustomer?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        id <- map["id"]
        orderNumber <- map["order_number"]
        createdAt <- (map["created_at"], ISO8601DateTransform())
        updatedAt <- (map["updated_at"], using: ISO8601DateTransform())
        completedAt <- (map["completed_at"], using: ISO8601DateTransform())
        status <- map["status"]
        currency <- map["currency"]
        total <- (map["total"], FloatTransform())
        subtotal <- (map["subtotal"], FloatTransform())
        totalLineItemQuantity <- map["total_line_items_quantity"]
        totalTax <- (map["total_tax"], FloatTransform())
        totalShipping <- (map["total_shipping"], FloatTransform())
        cartTax <- (map["cart_tax"], FloatTransform())
        shippingTax <- (map["shipping_tax"], FloatTransform())
        totalDiscount <- (map["total_discount"], FloatTransform())
        shippingMethods <- map["shipping_methods"]
        paymentDetails <- map["payment_details"]
        billingAddress <- map["billing_address"]
        shippingAddress <- map["shipping_address"]
        note <- map["note"]
        customerIp <- map["customer_ip"]
        customerUserAgent <- map["customer_user_agent"]
        customerId <- map["customer_id"]
        viewOrderUrl <- (map["view_order_url"], using: URLTransform())
        lineItems <- map["line_items"]
        shippingLines <- map["shipping_lines"]
        lineItems <- map["line_items"]
        taxLines <- map["tax_lines"]
        feeLines <- map["fee_lines"]
        couponLines <- map["coupon_lines"]
        customer <- map["customer"]
    }

    public static func get<T: Mappable>(id: Int, then complete: @escaping WooCompletion.Object<T>) {
        WooOS.main.api.getObject(type: WooRequestType.GetOrder(id), then: complete)
    }
    
    public static func update<T: Mappable>(id: Int, then complete: @escaping WooCompletion.Object<T>) {
        print("Update Order")
    }
    
    public static func create<T: Mappable>(id: Int, then complete: @escaping WooCompletion.Object<T>) {
        print("Create Order")
    }
}
