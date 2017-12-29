//
//  NetworkService.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import RxSwift

protocol NetworkService {
    
    func dataTask(forRequest request: URLRequest) -> Observable<Data>
    
}
