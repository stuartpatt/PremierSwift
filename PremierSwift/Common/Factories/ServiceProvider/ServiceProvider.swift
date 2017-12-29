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
    
    class func setupServices() {
        
        self.networkService = setupNetworkService()
        
    }
    
    func provide() -> NetworkService {
        
        return ServiceProvider.networkService
        
    }
    
}
