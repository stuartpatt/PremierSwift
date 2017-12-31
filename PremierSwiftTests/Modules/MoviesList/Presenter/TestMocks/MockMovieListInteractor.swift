//
//  MockMovieListInteractor.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MockMovieListInteractor: MovieListInteractor {
    
    var output: MovieListInteractorOutput?
    var fetchMoviesWasCalled = false
    var fetchMoviesResponse: FetchMoviesResponse?
    
    func fetchMovies() {
        
        fetchMoviesWasCalled = true
        
        guard let response = fetchMoviesResponse else { XCTFail("No response has been set for this mock"); return }
        
        switch response {
        
        case .success(let movies):
            
            output?.moviesFetched(movies)
            
        case .error(let error):
        
            output?.movieFetchFailed(withError: error)
        
        }
        
    }
    
    enum FetchMoviesResponse {
        
        case success([Movie])
        case error(Error)
        
    }

}
