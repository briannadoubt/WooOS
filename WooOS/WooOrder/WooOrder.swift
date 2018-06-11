import Foundation
import ObjectMapper

/// The order object used to represent an order on WooCommerce.
open class WooOrder: Mappable {
    
    /// Unique identifier for the resource.
    public var id: WooID?
    
    /// Parent order ID.
    public var parentID: WooID?
    
    /// Order number.
    public var number: String?
    
    /// Order key.
    public var orderKey: String?
    
    /// Shows where the order was created.
    public var createdVia: String?
    
    /// Version of WooCommerce which last updated the order.
    public var version: Int?
    
    /// Order status. Options: pending, processing, on-hold, completed, cancelled, refunded and failed. Default is pending.
    public var status: WooOrderStatus? = .pending
    
    /// Currency the order was created with, in ISO format. Options: AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD, AWG, AZN, BAM, BBD, BDT, BGN, BHD, BIF, BMD, BND, BOB, BRL, BSD, BTC, BTN, BWP, BYR, BZD, CAD, CDF, CHF, CLP, CNY, COP, CRC, CUC, CUP, CVE, CZK, DJF, DKK, DOP, DZD, EGP, ERN, ETB, EUR, FJD, FKP, GBP, GEL, GGP, GHS, GIP, GMD, GNF, GTQ, GYD, HKD, HNL, HRK, HTG, HUF, IDR, ILS, IMP, INR, IQD, IRR, IRT, ISK, JEP, JMD, JOD, JPY, KES, KGS, KHR, KMF, KPW, KRW, KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL, LYD, MAD, MDL, MGA, MKD, MMK, MNT, MOP, MRO, MUR, MVR, MWK, MXN, MYR, MZN, NAD, NGN, NIO, NOK, NPR, NZD, OMR, PAB, PEN, PGK, PHP, PKR, PLN, PRB, PYG, QAR, RON, RSD, RUB, RWF, SAR, SBD, SCR, SDG, SEK, SGD, SHP, SLL, SOS, SRD, SSP, STD, SYP, SZL, THB, TJS, TMT, TND, TOP, TRY, TTD, TWD, TZS, UAH, UGX, USD, UYU, UZS, VEF, VND, VUV, WST, XAF, XCD, XOF, XPF, YER, ZAR and ZMW. Default is USD.
    public var currency: WooCurrency? = .usd
    
    /// The date the order was created, in the site’s timezone.
    public var dateCreated: Date?
    
    /// The date the order was created, as GMT.
    public var dateCreatedGMT: Date?
    
    /// The date the order was last modified, in the site’s timezone.
    public var dateModified: Date?
    
    /// The date the order was last modified, as GMT.
    public var dateModifiedGMT: Date?
    
    /// Total discount amount for the order.
    public var discountTotal: String?
    
    /// Total discount tax amount for the order.
    public var discountTax: String?
    
    /// Total shipping amount for the order.
    public var shippingTotal: String?
    
    /// Total shipping tax amount for the order.
    public var shippingTax: String?
    
    /// Sum of line item taxes only.
    public var cartTax: String?
    
    /// Grand total.
    public var total: String?
    
    /// Sum of all taxes.
    public var totalTax: String?
    
    /// True the prices included tax during checkout.
    public var pricesIncludingTax: Bool?
    
    /// User ID who owns the order. 0 for guests. Default is 0.
    public var customerID: WooID?
    
    /// Customer’s IP address.
    public var customerIPAddress: String?
    
    /// User agent of the customer.
    public var customerUserAgent: String?
    
    /// Note left by customer during checkout.
    public var customerNote: String?
    
    /// Billing address. See Order - Billing properties
    public var billing: WooBilling?
    
    /// Shipping address. See Order - Shipping properties
    public var shipping: WooShipping?
    
    /// Payment method ID.
    public var paymentMethod: String?
    
    /// Payment method title.
    public var paymentMethodTitle: String?
    
    /// Unique transaction ID.
    public var transactionID: String?
    
    /// The date the order was paid, in the site’s timezone.
    public var datePaid: Date?
    
    /// The date the order was paid, as GMT.
    public var datePaidGMT: Date?
    
    /// The date the order was completed, in the site’s timezone.
    public var dateCompleted: Date?
    
    /// The date the order was completed, as GMT.
    public var dateCompletedGMT: Date?
    
    /// MD5 hash of cart items to ensure orders are not modified.
    public var cartHash: String?
    
    /// Meta data. See Order - Meta data properties
    public var metaData: [WooMetaData]?
    
    /// Line items data. See Order - Line items properties
    public var lineItems: [WooOrderLineItem]?
    
    /// Tax lines data. See Order - Tax lines properties
    public var taxLines: [WooOrderTaxLine]?
    
    /// Shipping lines data. See Order - Shipping lines properties
    public var shippingLines: [WooOrderShippingLine]?
    
    /// Fee lines data. See Order - Fee lines properties
    public var feeLines: [WooOrderFee]?
    
    /// Coupons line data. See Order - Coupon lines properties
    public var couponLines: [WooOrderInternalCoupon]?
    
    /// List of refunds. See Order - Refunds properties
    public var refunds: [WooOrderRefund]?
    
    /// Define if the order is paid. It will set the status to processing and reduce stock items. Default is false.
    public var setPaid: Bool? = false

    /// When initialized, WooOrder attempts to set the customerID from the currently signed in customer.
    public init() {
//        if let currentCustomerID = WooOS.main.currentCustomer?.id {
//            customerID = currentCustomerID
//        }
    }
    
    required public init?(map: Map) { }

    public func mapping(map: Map) {
        id <- map["id"]
        parentID <- map["parent_id"]
        number <- map["number"]
        orderKey <- map["order_key"]
        createdVia <- map["created_via"]
        status <- map["status"]
        currency <- map["currency"]
        dateCreated <- map["date_created"]
        dateCreatedGMT <- map["date_created_gmt"]
        dateModified <- map["date_modified"]
        dateModifiedGMT <- map["date_modified_gmt"]
        discountTotal <- map["discount_total"]
        discountTax <- map["discount_tax"]
        shippingTotal <- map["shipping_total"]
        shippingTax <- map["shipping_tax"]
        cartTax <- map["cart_tax"]
        total <- map["total"]
        totalTax <- map["total_tax"]
        pricesIncludingTax <- map["prices_include_tax"]
        customerID <- map["customer_id"]
        customerIPAddress <- map["customer_ip_address"]
        customerUserAgent <- map["customer_user_agent"]
        customerNote <- map["customer_note"]
        billing <- map["billing"]
        shipping <- map["shipping"]
        paymentMethod <- map["payment_method"]
        paymentMethodTitle <- map["payment_method_title"]
        transactionID <- map["transaction_id"]
        datePaid <- map["date_paid"]
        datePaidGMT <- map["date_paid_gmt"]
        dateCompleted <- map["date_completed"]
        dateCompletedGMT <- map["date_completed_gmt"]
        cartHash <- map["cart_hash"]
        metaData <- map["meta_data"]
        lineItems <- map["line_items"]
        taxLines <- map["tax_lines"]
        shippingLines <- map["shipping_lines"]
        feeLines <- map["fee_lines"]
        couponLines <- map["coupon_lines"]
        refunds <- map["refunds"]
        setPaid <- map["set_paid"]
    }

    static func get<T: Mappable>(order: Int, then complete: @escaping WooCompletion.Object<T>) {
        WooOS.main.api.getObject(type: .order(id: order), then: complete)
    }
    
    static func update<T: Mappable>(id: Int, then complete: @escaping WooCompletion.Object<T>) {
        print("Update Order")
    }
    
    static func create<T: Mappable>(id: Int, then complete: @escaping WooCompletion.Object<T>) {
        print("Create Order")
    }
}
