//
//  WooOSTests.swift
//  WooOSTests
//
//  Created by Brie on 6/2/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import ObjectMapper
import XCTest
import WooOS

class WooOSTests: XCTestCase {
    
    var baseURL: URL!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        guard let url = URL(string: "http://localhost:8081/wordpress") else {
            return
        }
        
        baseURL = url
        
        let _ = WooOS(baseURL: baseURL)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        baseURL = nil
        super.tearDown()
    }
    
    func testWooAPIInstanceIsNotNil() {
        XCTAssert(WooOS.main.api != nil)
    }
    
    func testWooCartInstanceIsNotNil() {
        XCTAssert(WooOS.main.cart != nil)
    }
    
    func testWooProductCanListPublicProducts() {
        let expectation = XCTestExpectation(description: "Download more than 0 products from WooCommerce.")
        WooProduct.list { (success, unsafeProducts, error) in
            guard success else {
                XCTAssert(false, error!.string)
                return
            }
            guard let _ = unsafeProducts else {
                XCTAssert(false, "No products were found. Make sure there are products in WooCommerce.")
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testWooProductCanDownloadSinglePublicProduct() {
        let expectation = XCTestExpectation(description: "Download a single product from WooCommerce with a valid ID.")
        WooProduct.get(product: 79) { (success, unsafeProduct, error) in
            guard success else {
                XCTAssert(false, error!.string)
                return
            }
            guard let _ = unsafeProduct else {
                XCTAssert(false, "No product was found. Make sure there are live products in WooCommerce.")
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testWooCategoryCanListAllPublicCategories() {
        let expectation = XCTestExpectation(description: "Download a list of all categories from WooCommerce.")
        WooCategory.listAll { (success, unsafeCategories, error) in
            guard success else {
                XCTAssert(false, error!.string)
                return
            }
            guard let _ = unsafeCategories else {
                XCTAssert(false, "No categories found. Make sure there are live categories in WooCommerce.")
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testWooBraintreeDoesRetrieveToken() {
        let expectation = XCTestExpectation(description: "Download Braintree transaction token.")
        
    }
}
