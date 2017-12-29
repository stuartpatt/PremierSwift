//
//  ServiceProvider+NetworkService.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import Alamofire

extension ServiceProvider {
    
    internal class func setupNetworkService() -> NetworkService {
        
        let sessionManager = Alamofire.SessionManager.default
        
        return AlamofireNetworkService(sessionManager: sessionManager)
        
    }
    
}
