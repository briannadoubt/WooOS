//
//  WooRequestType.swift
//  EightfoldYOGA
//
//  Created by brianna on 12/17/17.
//  Copyright © 2017 brianna. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public enum WooRequestConvertible: URLRequestConvertible {
    
    case coupons(parameters: [WooRequestParameter]?)
    case coupon(id: WooID)
    case createCoupon(coupon: WooCoupon)
    case updateCoupon(id: WooID, parameters: [WooRequestParameter]?)
    case deleteCoupon(id: WooID)
    
    case customers(parameters: [WooRequestParameter]?)
    case customer(id: WooID)
    case createCustomer(customer: WooCustomer)
    case updateCustomer(id: WooID, parameters: [WooRequestParameter]?)
    case deleteCustomer(id: WooID)
    
    case orders(parameters: [WooRequestParameter]?)
    case order(id: WooID)
    case createOrder(order: WooOrder)
    case updateOrder(id: WooID, parameters: [WooRequestParameter]?)
    case deleteOrder(id: WooID)
    
    case orderNotes(order: WooID, parameters: [WooRequestParameter]?)
    case orderNote(order: WooID, note: WooID)
    case createOrderNote(note: WooOrderNote)
    case updateOrderNote(order: WooID, note: WooID, parameters: [WooRequestParameter]?)
    case deleteOrderNote(order: WooID, note: WooID)
    
    case refunds(order: WooID, parameters: [WooRequestParameter]?)
    case refund(order: WooID, refund: WooID)
    case createRefund(order: WooID, refund: WooRefund)
    case deleteRefund(order: WooID, refund: WooID)
    
    case publicProducts(parameters: [WooRequestParameter]?)
    case publicProduct(id: WooID)
    
    case products(parameters: [WooRequestParameter]?)
    case product(id: WooID)
    case createProduct(product: WooProduct)
    case updateProduct(id: WooID, parameters: [WooRequestParameter]?)
    case deleteProduct(id: WooID)
    
    case reviews(product: WooID, parameters: [WooRequestParameter]?)
    case review(product: WooID, review: WooID)
    
    case variations(product: WooID, parameters: [WooRequestParameter]?)
    case variation(product: WooID, variation: WooID)
    case createVariation(product: WooID, variation: WooProductVariation)
    case updateVariation(product: WooID, variation: WooID, parameters: [WooRequestParameter]?)
    case deleteVariation(product: WooID, variation: WooID)
    
    case attributes(parameters: [WooRequestParameter]?)
    case attribute(id: WooID)
    case createAttribute(attribute: WooAttribute)
    case updateAttribute(id: WooID, parameters: [WooRequestParameter]?)
    case deleteAttribute(id: WooID)
    
    case attributeTerms(attribute: WooID, parameters: [WooRequestParameter]?)
    case attributeTerm(attribute: WooID, term: WooID)
    case createAttributeTerm(attribute: WooID, term: WooAttributeTerm)
    case updateAttributeTerm(attribute: WooID, term: WooID, parameters: [WooRequestParameter]?)
    case deleteAttributeTerm(attribute: WooID, term: WooID)
    
    case publicCategories(parameters: [WooRequestParameter]?)
    
    case categories(parameters: [WooRequestParameter]?)
    case category(id: WooID)
    case createCategory(category: WooCategory)
    case updateCategory(id: WooID, parameters: [WooRequestParameter]?)
    case deleteCategory(id: WooID)
    
    case shippingClasses(parameters: [WooRequestParameter]?)
    case shippingClass(id: WooID)
    case createShippingClass(shippingClass: WooShippingClass)
    case updateShippingClass(id: WooID, parameters: [WooRequestParameter]?)
    case deleteShippingClass(id: WooID)
    
    case tags(parameters: [WooRequestParameter]?)
    case tag(id: WooID)
    case createTag(tag: WooTag)
    case updateTag(id: WooID, parameters: [WooRequestParameter]?)
    case deleteTag(id: WooID)
    
    var baseURL: URL {
        return WooOS.main.api.siteURL
    }
    
    var path: String {
        
        switch self {
        
        case .coupons:
            return "/coupons"
        case .coupon(let id):
            return "/coupons/\(id)"
        case .createCoupon:
            return "/coupons"
        case .updateCoupon(let id):
            return "/coupons/\(id)"
        case .deleteCoupon(let id):
            return "/coupons/\(id)"
            
        case .customers:
            return "/customers"
        case .customer(let id):
            return "/customer/\(id)"
        case .createCustomer:
            return "/customer"
        case .updateCustomer(let id):
            return "/customer/\(id)"
        case .deleteCustomer(let id):
            return "/customer/\(id)"
            
        case .orders:
            return "/orders"
        case .order(let id):
            return "/orders/\(id)"
        case .createOrder:
            return "/orders"
        case .updateOrder(let id):
            return "/orders/\(id)"
        case .deleteOrder(let id):
            return "/orders/\(id)"
            
        case .orderNotes(let order):
            return "/orders/\(order)/notes"
        case .orderNote(let order, let note):
            return "/orders/\(order)/notes/\(note)"
        case .createOrderNote(let order):
            return "/orders/\(order)/notes"
        case .updateOrderNote(let order, let note, _):
            return "/orders/\(order)/notes/\(note)"
        case .deleteOrderNote(let order, let note):
            return "/orders/\(order)/notes/\(note)"
            
        case .refunds(let order):
            return "/orders/\(order)/refunds"
        case .refund(let order, let refund):
            return "/orders/\(order)/refunds/\(refund)"
        case .createRefund(let order):
            return "/orders/\(order)/refunds"
        case .deleteRefund(let order, let refund):
            return "/orders/\(order)/refunds/\(refund)"
            
        case .publicProducts:
            return "/products/public"
        case .publicProduct(let id):
            return "/products/\(id)/public"
            
        case .products:
            return "/products"
        case .product(let id):
            return "/products/\(id)"
        case .createProduct:
            return "/products/"
        case .updateProduct(let id):
            return "/products/\(id)/"
        case .deleteProduct(let id):
            return "/products/\(id)/"
            
        case .reviews(let product):
            return "/products/\(product)/reviews"
        case .review(let product, let review):
            return "/products/\(product)/reviews/\(review)"
            
        case .variations(let product):
            return "/products/\(product)/variations"
        case .variation(let product, let variation):
            return "/products/\(product)/variations/\(variation)"
        case .createVariation(let product):
            return "/products/\(product)/variations"
        case .updateVariation(let product, let variation, _):
            return "/products/\(product)/variations/\(variation)"
        case .deleteVariation(let product, let variation):
            return "/products/\(product)/variations/\(variation)"
            
        case .attributes:
            return "/products/attributes"
        case .attribute(let id):
            return "/products/attributes/\(id)"
        case .createAttribute:
            return "/products/attributes"
        case .updateAttribute(let id):
            return "/products/attributes/\(id)"
        case .deleteAttribute(let id):
            return "/products/attributes/\(id)"
            
        case .attributeTerms(let attribute):
            return "/products/attributes/\(attribute)/terms"
        case .attributeTerm(let attribute, let term):
            return "/products/attributes/\(attribute)/terms/\(term)"
        case .createAttributeTerm(let attribute):
            return "/products/attributes/\(attribute)/terms"
        case .updateAttributeTerm(let attribute, let term, _):
            return "/products/attributes/\(attribute)/terms/\(term)"
        case .deleteAttributeTerm(let attribute, let term):
            return "/products/attributes/\(attribute)/terms/\(term)"
            
        case .publicCategories:
            return "/products/categories/public"
            
        case .categories:
            return "/products/categories/"
        case .category(let id):
            return "/products/categories/\(id)"
        case .createCategory:
            return "/products/categories"
        case .updateCategory(let id):
            return "/products/categories/\(id)"
        case .deleteCategory(let id):
            return "/products/categories/\(id)"
            
        case .shippingClasses:
            return "/products/shipping_classes"
        case .shippingClass(let id):
            return "/products/shipping_classes/\(id)"
        case .createShippingClass:
            return "/products/shipping_classes"
        case .updateShippingClass(let id):
            return "/products/shipping_classes/\(id)"
        case .deleteShippingClass(let id):
            return "/products/shipping_classes/\(id)"
            
        case .tags:
            return "/products/tags"
        case .tag(let id):
            return "/products/tags/\(id)"
        case .createTag:
            return "/products/tags"
        case .updateTag(let id):
            return "/products/tags/\(id)"
        case .deleteTag(let id):
            return "/products/tags/\(id)"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .coupons:
            return .get
        case .coupon:
            return .get
        case .createCoupon:
            return .post
        case .updateCoupon:
            return .put
        case .deleteCoupon:
            return .delete
            
        case .customers:
            return .get
        case .customer:
            return .get
        case .createCustomer:
            return .post
        case .updateCustomer:
            return .put
        case .deleteCustomer:
            return .delete
            
        case .orders:
            return .get
        case .order:
            return .get
        case .createOrder:
            return .post
        case .updateOrder:
            return .put
        case .deleteOrder:
            return .delete
            
        case .orderNotes:
            return .get
        case .orderNote:
            return .get
        case .createOrderNote:
            return .post
        case .updateOrderNote:
            return .put
        case .deleteOrderNote:
            return .delete
            
        case .refunds:
            return .get
        case .refund:
            return .get
        case .createRefund:
            return .post
        case .deleteRefund:
            return .delete
            
        case .publicProducts:
            return .get
        case .publicProduct:
            return .get
            
        case .products:
            return .get
        case .product:
            return .get
        case .createProduct:
            return .post
        case .updateProduct:
            return .put
        case .deleteProduct:
            return .delete
            
        case .reviews:
            return .get
        case .review:
            return .get
        case .variations:
            return .get
        case .variation:
            return .get
        case .createVariation:
            return .post
        case .updateVariation:
            return .put
        case .deleteVariation:
            return .delete
            
        case .attributes:
            return .get
        case .attribute:
            return .get
        case .createAttribute:
            return .post
        case .updateAttribute:
            return .put
        case .deleteAttribute:
            return .delete
            
        case .attributeTerms:
            return .get
        case .attributeTerm:
            return .get
        case .createAttributeTerm:
            return .post
        case .updateAttributeTerm:
            return .put
        case .deleteAttributeTerm:
            return .delete
            
        case .publicCategories:
            return .get
            
        case .categories:
            return .get
        case .category:
            return .get
        case .createCategory:
            return .post
        case .updateCategory:
            return .put
        case .deleteCategory:
            return .delete
            
        case .shippingClasses:
            return .get
        case .shippingClass:
            return .get
        case .createShippingClass:
            return .post
        case .updateShippingClass:
            return .put
        case .deleteShippingClass:
            return .delete
            
        case .tags:
            return .get
        case .tag:
            return .get
        case .createTag:
            return .post
        case .updateTag:
            return .put
        case .deleteTag:
            return .delete
            
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let fullPath = WooAPI.version + path
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(fullPath))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest = executeEncoding(for: urlRequest)
        
        return urlRequest
    }
    
    private func executeEncoding(for urlRequest: URLRequest) -> URLRequest {
        
        do {
            switch self {
            case .coupons(let parameters):
                return encode(urlRequest, with: parameters)
            case .createCoupon(let coupon):
                return try JSONEncoding.default.encode(urlRequest, with: coupon.toJSON())
                
            case .customers(let parameters):
                return encode(urlRequest, with: parameters)
            case .createCustomer(let customer):
                return try JSONEncoding.default.encode(urlRequest, with: customer.toJSON())
            case .updateCustomer(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .orders(let parameters):
                return encode(urlRequest, with: parameters)
            case .createOrder(let order):
                return try JSONEncoding.default.encode(urlRequest, with: order.toJSON())
            case .updateOrder(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .orderNotes(_, let parameters):
                return encode(urlRequest, with: parameters)
            case .createOrderNote(let note):
                return try JSONEncoding.default.encode(urlRequest, with: note.toJSON())
            case .updateOrderNote(_, _, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .refunds(_, let parameters):
                return encode(urlRequest, with: parameters)
            case .createRefund(_, let refund):
                return try JSONEncoding.default.encode(urlRequest, with: refund.toJSON())
                
            case .publicProducts(let parameters):
                return encode(urlRequest, with: parameters)
                
            case .products(let parameters):
                return encode(urlRequest, with: parameters)
            case .createProduct(let product):
                return try JSONEncoding.default.encode(urlRequest, with: product.toJSON())
            case .updateProduct(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .reviews(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .variations(_, let parameters):
                return encode(urlRequest, with: parameters)
            case .createVariation(_, let variation):
                return try JSONEncoding.default.encode(urlRequest, with: variation.toJSON())
            case .updateVariation(_, _, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .attributes(let parameters):
                return encode(urlRequest, with: parameters)
            case .createAttribute(let attribute):
                return try JSONEncoding.default.encode(urlRequest, with: attribute.toJSON())
            case .updateAttribute(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .attributeTerms(_, let parameters):
                return encode(urlRequest, with: parameters)
            case .createAttributeTerm(_, let term):
                return try JSONEncoding.default.encode(urlRequest, with: term.toJSON())
            case .updateAttributeTerm(_, _, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .publicCategories(let parameters):
                return encode(urlRequest, with: parameters)
                
            case .categories(let parameters):
                return encode(urlRequest, with: parameters)
            case .createCategory(let category):
                return try JSONEncoding.default.encode(urlRequest, with: category.toJSON())
            case .updateCategory(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .shippingClasses(let parameters):
                return encode(urlRequest, with: parameters)
            case .createShippingClass(let shippingClass):
                return try JSONEncoding.default.encode(urlRequest, with: shippingClass.toJSON())
            case .updateShippingClass(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            case .tags(let parameters):
                return encode(urlRequest, with: parameters)
            case .createTag(let tag):
                return try JSONEncoding.default.encode(urlRequest, with: tag.toJSON())
            case .updateTag(_, let parameters):
                return encode(urlRequest, with: parameters)
                
            default:
                return urlRequest
            }
        
        } catch {
            return urlRequest
        }
    }
    
    private func encode(_ urlRequest: URLRequest, with parameters: [WooRequestParameter]?) -> URLRequest {
        
        // Create the list parameters dictionary to be returned and used in the request.
        var allParameters: [String: Any] = [:]
        
        // Unwrap the parameters dictionary.
        guard let safeParameters: [WooRequestParameter] = parameters else {
            return urlRequest
        }
            
        // Add each parameter from the given parameters dictionary to the list parameters dictionary to be used in the request.
        for parameter in safeParameters {
            allParameters[parameter.key] = parameter.value
        }
        
        // Construct the URLRequest to return
        let encodedURLRequest = try? URLEncoding.default.encode(urlRequest, with: allParameters)
        
        return encodedURLRequest ?? urlRequest
    }
}
