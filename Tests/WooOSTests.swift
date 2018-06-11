//
//  WooOSTests.swift
//  WooOSTests
//
//  Created by Brie on 6/2/18.
//  Copyright © 2018 Brianna Lee. All rights reserved.
//

import ObjectMapper
import XCTest
@testable import WooOS

class WooOSTests: XCTestCase {
    
    var baseURL: URL!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        guard let url = URL(string: "http://localhost:8081") else {
            return
        }
        
        baseURL = url
        
        let wooOS = WooOS(baseURL: baseURL)
        wooOS.api = WooAPI(url: baseURL)
        wooOS.cart = WooCart()
        wooOS.currentCustomer = WooCustomer()
        WooOS.main = wooOS
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        baseURL = nil
        super.tearDown()
    }
    
    func testWooAPIInstanceIsNotNil() {
        XCTAssert(WooOS.main.api != nil)
    }
    
}
