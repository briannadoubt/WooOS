
import Foundation
import ObjectMapper

/// This is the main class for all of WooOS, the SDK that allows developers to interface with the WooOS REST API.
public class WooOS {
    
    //  ------------------------
    /// MARK: - Static Variables
    //  ------------------------
    
    /// Shared instance
    public static var main: WooOS!
    
    //  --------------------------------
    /// MARK: - Instance level variables
    //  --------------------------------
    
    /// The singleton WooAPI instance where all network requests are made.
    public var api: WooAPI!
    
    /// The WooCart singleton for managing a customer's cart and checkout process.
    public var cart: WooCart!
    
//    /// The WooAuthentication singleton that manages the current session of the app's instance.
//    public var auth: WooAuthentication!
    
    /// The stored customer of the user that is currently signed in. If a user is not authenticated this value is nil.
    public var currentCustomer: WooCustomer?
    
    //  ----------------------
    /// MARK: - Initialization
    //  ----------------------

    /// Initializer used to instantiate the main shared instance.
    ///
    /// - Parameters:
    ///   - url: The base site URL of the WooCommerce store.
    ///   - key: The Consumer Key found in the WooCommerce API settings.
    ///   - secret: The Consumer Secret found in the WooCommerce API settings.
    public init(baseURL: URL, key: String? = nil, secret: String? = nil) {
        api = WooAPI(url: baseURL, key: key, secret: secret)
        cart = WooCart()
        WooOS.main = self
    }
}
