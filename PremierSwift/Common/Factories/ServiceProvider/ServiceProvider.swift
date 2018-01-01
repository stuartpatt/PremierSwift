//
//  ServiceProvider.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

class ServiceProvider {
    
    private static var networkService: NetworkService!
    private static var decoder: JSONDecoder!
    
    class func setupServices() {
        
        self.networkService = setupNetworkService()
        
        self.decoder = setupJSONDecoder()
        
    }
    
    func provide() -> NetworkService {
        
        return ServiceProvider.networkService
        
    }
    
    func provide() -> JSONDecoder {
        
        return ServiceProvider.decoder
        
    }
    
}
