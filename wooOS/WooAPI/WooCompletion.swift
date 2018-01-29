//
//  WooCompletion.swift
//  Eightfold
//
//  Created by brianna on 1/28/18.
//  Copyright © 2018 Owly Design. All rights reserved.
//

import Foundation
import ObjectMapper

public class WooCompletion {
    public typealias Array<T: Mappable> = (_ success: Bool, _ value: [T]?, _ error: String?) -> Void
    
    public typealias Object<T: Mappable> = (_ success: Bool, _ value: T?, _ error: String?) -> Void
    
    public typealias Token = (_ success: Bool, _ token: String?, _ error: String?) -> Void
}
