//
//  MockMovieListUseCase.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest
import RxSwift

@testable import PremierSwift
class MockMovieListUseCase: MovieListUseCase {
    
    var moviesWasCalled = false
    var moviesResponse: MovieListResponse?
    
    func movies() -> Observable<[Movie]> {
        
        moviesWasCalled = true
        
        guard let response = moviesResponse else { XCTFail("No response has been set for this mock"); return Observable.empty() }
        
        switch response {
            
        case .success(let movies):
            
            return Observable.from(optional: movies)
            
        case .error(let error):
            
            return Observable.error(error)
            
        }
        
    }
    
    enum MovieListResponse {
        
        case success([Movie])
        case error(Error)
        
    }
    
}
