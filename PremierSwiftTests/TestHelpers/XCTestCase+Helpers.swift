//
//  XCTestCase+Helpers.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func data(forJSONFileNamed fileName: String) throws -> Data {
        
        let testBundle = Bundle(for: type(of: self))
        
        guard let path = testBundle.url(forResource: fileName, withExtension: nil) else {
            
            throw XCTestError.jsonFileNotFound
            
        }
        
        return try Data(contentsOf: path)
        
    }
    
    internal enum XCTestError: Error {
        
        case jsonFileNotFound
        
    }

}
