//
//  MockMovieListView.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
@testable import PremierSwift

class MockMovieListView: MovieListView {
    
    var receivedMovies: [Movie]?
    var receivedError: Error?
    
    func showMovieList(_ movies: [Movie]) {
        
        receivedMovies = movies
        
    }
    
    func showFetchError(_ error: Error) {
        
        receivedError = error
    }
    
}
