import Foundation
import ObjectMapper

public struct WooLineItem: Mappable {
    public var id: Int?
    public var subtotal: Float?
    public var subtotalTax: Float?
    public var total: Float?
    public var totalTax: Float?
    public var price: Float?
    public var quantity: Int?
    public var taxClass: String?
    public var name: String?
    public var productId: Int?
    public var sku: String?
    public var meta: [String: String]?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        id <- map["id"]
        subtotal <- (map["subtotal"], FloatTransform())
        subtotalTax <- (map["subtotal_tax"], FloatTransform())
        total <- (map["total"], FloatTransform())
        totalTax <- (map["total_tax"], FloatTransform())
        price <- (map["price"], FloatTransform())
        quantity <- map["quantity"]
        taxClass <- map["tax_class"]
        name <- map["name"]
        productId <- map["product_id"]
        sku <- map["sku"]
        meta <- map["meta"]
    }
}
