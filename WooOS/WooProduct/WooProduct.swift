import Foundation
import ObjectMapper

/// The object representing a Product downloaded from WooCommerce.
///
/// - Discussion:
///   - While it is tempting to use the product images directly from the array of WooImage instances, it is better to retrieve all variations of the product by calling `ProductVariation.listFrom(product: <id>)` 
open class WooProduct: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// Product name.
    public var name: String?
    
    /// Product slug.
    public var slug: String?
    
    /// Product URL.
    public var permalink: URL?
    
    /// The date the product was created, in the site’s timezone.
    public var dateCreated: Date?
    
    /// The date the product was created, as GMT.
    public var dateCreatedGMT: Date?
    
    /// The date the product was last modified, in the site’s timezone.
    public var dateModified: Date?
    
    /// The date the product was last modified, as GMT.
    public var dateModifiedGMT: Date?
    
    /// Product type. Options: simple, grouped, external and variable. Default is simple.
    public var type: WooProductType? = .simple
    
    /// Product status (post status). Options: draft, pending, private and publish. Default is publish.
    public var status: WooProductStatus? = .publish
    
    /// Featured product. Default is false.
    public var featured: Bool? = false
    
    /// Catalog visibility. Options: visible, catalog, search and hidden. Default is visible.
    public var catalogVisibility: WooProductCatalogVisibility? = .visible
    
    /// Product description.
    public var productDescription: String?
    
    /// Product short description.
    public var shortDescription: String?
    
    /// Unique identifier.
    public var sku: String?
    
    /// Current product price.
    public var price: Float?
    
    /// Product regular price.
    public var regularPrice: Float?
    
    /// Product sale price.
    public var salePrice: Float?
    
    /// Start date of sale price, in the site’s timezone.
    public var dateOnSaleFrom: Date?
    
    /// Start date of sale price, as GMT.
    public var dateOnSaleFromGMT: Date?
    
    /// End date of sale price, in the site’s timezone.
    public var dateOnSaleTo: Date?
    
    /// End date of sale price, in the site’s timezone.
    public var dateOnSaleToGMT: Date?
    
    /// Price formatted in HTML.
    public var priceHtml: String?
    
    /// Shows if the product is on sale.
    public var onSale: Bool?
    
    /// Shows if the product can be bought.
    public var purchasable: Bool?
    
    /// Amount of sales.
    public var totalSales: Int?
    
    /// If the product is virtual. Default is false.
    public var virtual: Bool? = false
    
    /// If the product is downloadable. Default is false.
    public var downloadable: Bool? = false
    
    /// List of downloadable files. See ProductDownload class properties
    public var downloads: [WooDownload]?
    
    /// Number of times downloadable files can be downloaded after purchase. Default is -1.
    public var downloadLimit: Int? = -1
    
    /// Number of days until access to downloadable files expires. Default is -1.
    public var downloadExpiry: Int? = -1
    
    /// Product external URL. Only for external products.
    public var externalURL: URL?
    
    /// Product external button text. Only for external products.
    public var buttonText: String?
    
    /// Tax status. Options: taxable, shipping and none. Default is taxable.
    public var taxStatus: WooTaxStatus? = .taxable
    
    /// Tax class.
    public var taxClass: String?
    
    /// Stock management at product level. Default is false.
    public var manageStock: Bool? = false
    
    /// Stock quantity.
    public var stockQuantity: Int?
    
    /// Controls whether or not the product is listed as “in stock” or “out of stock” on the frontend. Default is true.
    public var inStock: Bool? = true
    
    /// If managing stock, this controls if backorders are allowed. Options: no, notify and yes. Default is no.
    public var backorders: WooBackorder? = .no
    
    /// Shows if backorders are allowed.
    public var backordersAllowed: Bool?
    
    /// Shows if the product is on backordered.
    public var backordered: Bool?
    
    /// Allow one item to be bought in a single order. Default is false.
    public var soldIndividually: Bool? = false
    
    /// Product weight.
    public var weight: String?
    
    /// Product dimensions. See ProductDimensions class properties
    public var dimensions: WooDimensions?
    
    /// Shows if the product need to be shipped.
    public var shippingRequired: Bool?
    
    /// Shows whether or not the product shipping is taxable.
    public var shippingTaxable: Bool?
    
    /// Shipping class slug.
    public var shippingClass: String?
    
    /// Shipping class ID.
    public var shippingClassId: Int?
    
    /// Allow reviews. Default is true.
    public var reviewsAllowed: Bool? = true
    
    /// The reviews associated with the product.
    public var reviews: [WooProductReview]?
    
    /// Reviews average rating.
    public var averageRating: String?
    
    /// Amount of reviews that the product have.
    public var ratingCount: Int?
    
    /// List of related products IDs.
    public var relatedIds: [WooID]?
    
    /// List of up-sell products IDs.
    public var upsellIds: [WooID]?
    
    /// List of cross-sell products IDs.
    public var crossSellIds: [WooID]?
    
    /// Product parent ID.
    public var parentId: WooID?
    
    /// Optional note to send the customer after purchase.
    public var purchaseNote: String?
    
    /// List of categories. See InternalProductCategory class properties.
    public var categories: [WooCategory]?
    
    /// List of tags. See  properties
    public var tags: [WooTag]?
    
    /// List of images. See ProductImage class properties
    public var images: [WooImage]?
    
    /// List of attributes. See ProductAttribute struct properties
    public var attributes: [WooAttribute]?
    
    /// Defaults variation attributes. See ProductAttribute struct properties
    public var defaultAttributes: [WooAttribute]?
    
    /// List of variations IDs.
    public var variationIDs: [WooID]?
    
    /// List of product variations associated to this product.
    public var variations: [WooProductVariation]?
    
    /// List of grouped products ID.
    public var groupedProducts: [WooID]?
    
    /// Menu order, used to custom sort products.
    public var menuOrder: Int?
    
    /// Meta data. See Product - Meta data properties
    public var metaData: [WooMetaData]?
    
    /// Links to web version
    public var url: URL?
    
    /// Link to collection
    public var collectionURL: URL?

    required public init?(map: Map) { }

    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        permalink <- (map["permalink"], using: URLTransform())
        dateCreated <- (map["date_created"], using: ISO8601DateTransform())
        dateCreatedGMT <- (map["date_created_gmt"], using: ISO8601DateTransform())
        dateModified <- (map["date_modified"], using: ISO8601DateTransform())
        dateModifiedGMT <- (map["date_modified_gmt"], using: ISO8601DateTransform())
        type <- map["type"]
        status <- map["status"]
        featured <- map["featured"]
        catalogVisibility <- map["catalog_visibility"]
        productDescription <- map["description"]
        shortDescription <- map["short_description"]
        sku <- map["sku"]
        price <- (map["price"], FloatTransform())
        regularPrice <- (map["regular_price"], FloatTransform())
        salePrice <- (map["sale_price"], FloatTransform())
        dateOnSaleFrom <- (map["date_on_sale_from"], using: ISO8601DateTransform())
        dateOnSaleFromGMT <- (map["date_on_sale_from_gmt"], using: ISO8601DateTransform())
        dateOnSaleTo <- (map["date_on_sale_to"], using: ISO8601DateTransform())
        dateOnSaleToGMT <- (map["date_on_sale_to_gmt"], using: ISO8601DateTransform())
        priceHtml <- map["price_html"]
        onSale <- map["on_sale"]
        purchasable <- map["purchasable"]
        totalSales <- map["total_sales"]
        virtual <- map["virtual"]
        downloadable <- map["downloadable"]
        downloads <- map["downloads"]
        downloadLimit <- map["download_limit"]
        downloadExpiry <- map["download_expiry"]
        externalURL <- (map["external_url"], using: URLTransform())
        buttonText <- map["button_text"]
        taxStatus <- map["tax_status"]
        taxClass <- map["tax_class"]
        manageStock <- map["manage_stock"]
        stockQuantity <- map["stock_quantity"]
        inStock <- map["in_stock"]
        backorders <- map["backorders"]
        backordersAllowed <- map["backorders_allowed"]
        backordered <- map["backordered"]
        soldIndividually <- map["sold_individually"]
        weight <- map["weight"]
        dimensions <- map["dimensions"]
        shippingRequired <- map["shipping_required"]
        shippingTaxable <- map["shipping_taxable"]
        shippingClass <- map["shipping_class"]
        shippingClassId <- map["shipping_class_id"]
        reviewsAllowed <- map["reviews_allowed"]
        averageRating <- map["average_rating"]
        ratingCount <- map["rating_count"]
        relatedIds <- map["related_ids"]
        upsellIds <- map["upsell_ids"]
        crossSellIds <- map["cross_sell_ids"]
        parentId <- map["parent_id"]
        purchaseNote <- map["purchase_note"]
        categories <- map["categories"]
        tags <- map["tags"]
        images <- map["images"]
        attributes <- map["attributes"]
        defaultAttributes <- map["default_attributes"]
        variationIDs <- map["variations"]
        groupedProducts <- map["grouped_products"]
        menuOrder <- map["menu_order"]
        metaData <- map["meta_data"]
        
        url <- map["_links.self.href.value"]
        collectionURL <- map["_links.collection.href.value"]
    }
    
//    func getReviews() {
//        if let safeID = id {
//            WooProductReview.listFrom(product: safeID, with: [.parent([safeID])]) { success, newReviews, error in
//
//                guard success else {
//                    print(error?.string ?? "Unknown Error")
//                    self.reviews = []
//                    return
//                }
//
//                self.reviews = newReviews
//            }
//        }
//    }
    
//    func getVariations() {
//        if let safeID = id {
//            WooProductVariation.listFrom(product: safeID, with: [.parent([safeID])]) { success, newVariations, error in
//                
//                guard success else {
//                    print(error?.string ?? "Unknown Error")
//                    self.variations = []
//                    return
//                }
//                
//                self.variations = newVariations
//                
//                self.delegate?.didDownloadNewVariations()
//            }
//        }
//    }

    /// Download a single product.
    ///
    /// - Parameters:
    ///   - id: ID of the product to download.
    ///   - complete: WooCompletion Object completion
    public static func get<T: WooProduct>(product: Int,
                                   then complete: WooCompletion.Object<T>? = nil) {
        WooOS.main.api.getObject(type: .publicProduct(id: product), then: complete)
    }
    
    public static func getComplete<T: WooProduct>(product: Int,
                                           then complete: WooCompletion.Object<T>? = nil) {
    }

    /// Download a list of products with the specified parameters.
    ///
    /// - Parameters:
    ///   - parameters: The prooduct request parameters defining which products to download.
    ///   - complete: Asynchronous completion containing a success flag, the list of products, and an optional error.
    public static func list<T: WooProduct>(with parameters: [WooProductRequestParameter]? = nil,
                                              then complete: WooCompletion.List<T>?) {
        WooOS.main.api.getList(of: .publicProducts(parameters: parameters), then: complete)
    }
}
