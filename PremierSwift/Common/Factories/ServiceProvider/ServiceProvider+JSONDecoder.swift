//
//  ServiceProvider+JSONDecoder.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 01/01/2018.
//  Copyright © 2018 Deliveroo. All rights reserved.
//

import Foundation

extension ServiceProvider {
    
    internal class func setupJSONDecoder() -> JSONDecoder {
        
        return JSONDecoder()
        
    }
    
}
