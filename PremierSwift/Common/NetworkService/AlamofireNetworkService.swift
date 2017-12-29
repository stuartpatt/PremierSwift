//
//  AlamofireNetworkService.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

struct AlamofireNetworkService: NetworkService {
    
    let sessionManager: SessionManager
    
    func dataTask(forRequest request: URLRequest) -> Observable<Data> {
        
        return sessionManager.rx.request(urlRequest: request)
            
            .flatMap { request in
                
                return request.validate(statusCode: 200...299).rx.data()
                
        }
        
    }
    
}
