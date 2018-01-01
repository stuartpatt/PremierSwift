//
//  PrimaryServiceFactory.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

class PrimaryServiceFactory: ServiceFactory {
    
    var networkService: NetworkService
    var decoder: JSONDecoder
    
    static func serviceFactory() -> PrimaryServiceFactory {
        
        let serviceProvider = ServiceProvider()
        
        return PrimaryServiceFactory(serviceProvider: serviceProvider)
        
    }
    
    private init(serviceProvider: ServiceProvider) {
        
        self.networkService = serviceProvider.provide()
        
        self.decoder = serviceProvider.provide()
        
    }
    
    func movieListUseCase() -> MovieListUseCase {
        
        return MovieListRemote(networkService: networkService, decoder: decoder)
        
    }
    
}
