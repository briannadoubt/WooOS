import Foundation
import ObjectMapper

/// A collection of products arranged into a category.
open class WooCategory: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// Category name.
    public var name: String?
    
    /// An alphanumeric identifier for the resource unique to its type.
    public var slug: String?
    
    /// The ID for the parent of the resource.
    public var parent: WooID?
    
    /// HTML description of the resource.
    public var description: String?
    
    /// Category archive display type. Options: default, products, subcategories and both. Default is default.
    public var display: WooCategoryDisplay? = .defaultDisplay
    
    /// Image data. See Product category - Image properties
    public var image: WooImage?
    
    /// Menu order, used to custom sort the resource.
    public var menuOrder: Int?
    
    /// Number of published products for the resource.
    public var count: Int?
    
    /// Links to web version
    public var url: URL?
    
    /// Link to collection
    public var collectionURLs: URL?

    required public init?(map: Map) {}

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
        url <- map["_links.self.0.value"]
        collectionURLs <- map["_links.collection.0.value"]
    }
    
    public static func get<T: WooCategory>(category: Int,
                                           then complete: @escaping WooCompletion.Object<T>) {
        WooOS.main.api.getObject(type: WooRequestConvertible.category(id: category), then: complete)
    }

    /// Get all categories for the store.
    ///
    /// - Parameters:
    ///   - complete: Asynchronous completion block for returning the array properties. Passed through to the core API call.
    public static func listAll<T: WooCategory>(then complete: @escaping WooCompletion.List<T>) {
        let parameters: [WooCategoryRequestParameter] = [.hideEmpty(true), .perPage(50)]
        WooOS.main.api.getList(of: .publicCategories(parameters: parameters), then: complete)
    }
}
