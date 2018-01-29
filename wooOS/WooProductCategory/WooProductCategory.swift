import Foundation
import ObjectMapper

public class WooProductCategory: Mappable {
    public var id: Int?
    public var name: String?
    public var slug: String?
    public var parent: Int?
    public var description: String?
    public var display: WooProductCategoryDisplay?
    public var image: WooProductImage?
    public var menuOrder: Int?
    public var count: Int?

    public required init?(map: Map) {}

    public init() {}

    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        parent <- map["parent"]
        description <- map["description"]
        display <- map["display"]
        image <- map["image"]
        menuOrder <- map["menu_order"]
        count <- map["count"]
    }

    public static func getList<T: WooProductCategory>(with limit: Int = 50, then complete: @escaping WooCompletion.Array<T>) {
        let parameters = WooRequestParameters.Array(type: .GetAllCategories, limit: 25)
        WooOS.main.api.getList(with: parameters, then: complete)
    }
}
