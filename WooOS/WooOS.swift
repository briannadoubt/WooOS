
import Foundation
import ObjectMapper

/// Used to specify a unique identifier within WooOS.
typealias WooID = Int

/// This is the main class for all of WooOS, the SDK that allows developers to interface with the WooCommerce REST API.
class WooOS {
    
    //  ------------------------
    /// MARK: - Static Variables
    //  ------------------------
    
    /// Shared instance
    static var main: WooOS!
    
    //  --------------------------------
    /// MARK: - Instance level variables
    //  --------------------------------
    
    /// The singleton WooAPI instance where all network requests are made.
    var api: WooAPI!
    
    /// The WooCart singleton for managing a customer's cart and checkout process.
    var cart: WooCart!
    
    /// The stored customer of the user that is currently signed in. If a user is not authenticated this value is nil.
    var currentCustomer: WooCustomer?
    
    //  ----------------------
    /// MARK: - Initialization
    //  ----------------------

    /// Initializer used to instantiate the main shared instance.
    ///
    /// - Parameters:
    ///   - url: The base site URL of the WooCommerce store.
    ///   - key: The Consumer Key found in the WooCommerce API settings.
    ///   - secret: The Consumer Secret found in the WooCommerce API settings.
    init(baseURL: URL, key: String? = nil, secret: String? = nil) {
        api = WooAPI(url: baseURL, key: key, secret: secret)
        cart = WooCart()
        WooOS.main = self
    }
}
