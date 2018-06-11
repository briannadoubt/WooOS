//
//  WooError.swift
//  Eightfold
//
//  Created by brianna on 1/21/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation

/// The error type for all WooOS errors.
public enum WooError: Error {
    
    case fatalError(description: String)
    
    case wooCommerceError(description: String)
    
    case customerIDNil(decription: String)
    case cannotConstructURL(description: String)
    case couldNotParseJSON(description: String)
    case unsuccessfulRequestResponse(description: String)
    case couldNotGetToken(description: String)
    case couldNotSaveToken(description: String)
    case noToken(description: String)
    case emptyAttribute(description: String)
    case noObjectsFoundForGivenRequest(description: String)
    case noProductID(description: String)
    case cannotAddItemToCart(description: String)
    case attributeNotSelected(attributeType: String)
    case invalidURL(description: String)
    case noUsernameSet(description: String)
    case signupFailed(description: String)
    case managerCredentialsAreNil(description: String)
    
    /// The string to print when there is an error.
    public var string: String {
        switch self {
        case .fatalError(let description):
            return "Fatal Error: " + description
        case .wooCommerceError(let description):
            return "WooCommerce Error: " + description
        case .customerIDNil(let description):
            return "Customer ID isn nil: " + description
        case .cannotConstructURL(let description):
            return "Cannot Construct URL: " + description
        case .couldNotParseJSON(let description):
            return "Could not parse JSON: " + description
        case .unsuccessfulRequestResponse(let description):
            return "Unsuccessful Request Response: " + description
        case .couldNotGetToken(let description):
            return "Could Not Get Token: " + description
        case .couldNotSaveToken(let description):
            return "Could Not Save Token: " + description
        case .noToken(let description):
            return "No Token: " + description
        case .emptyAttribute(let description):
            return "Empty Attribute: " + description
        case .noObjectsFoundForGivenRequest(let description):
            return "No Objects Found For Given Request: " + description
        case .noProductID(let description):
            return "No Product ID: " + description
        case .cannotAddItemToCart(let description):
            return "Cannot Add Items To The Cart: " + description
        case .attributeNotSelected(let attributeType):
            return attributeType
        case .invalidURL(let description):
            return "Invalid URL: " + description
        case .noUsernameSet(let description):
            return "No username is saved for the current user: " + description
        case .signupFailed(let description):
            return "Failed sign up: " + description
        case .managerCredentialsAreNil(let description):
            return "Could not find consumer key or secret: " + description
        }
    }
}
