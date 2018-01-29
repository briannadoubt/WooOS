import Foundation
import ObjectMapper

public struct WooPaymentDetails: Mappable {
    public var methodId: String?
    public var methodTitle: String?
    public var paid: Bool?

    public init?(map: Map) {}

    mutating public func mapping(map: Map) {
        methodId <- map["method_id"]
        methodTitle <- map["method_title"]
        paid <- map["paid"]
    }
}
