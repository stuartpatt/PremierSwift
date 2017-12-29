//
//  MovieListInteractor.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

protocol MovieListInteractor: class {
    
    var output: MovieListInteractorOutput? { get set }
    
    func fetchMovies()
    
}

protocol MovieListInteractorOutput {
    
    func moviesFetched(_ movies: [Movie])
    
    func movieFetchFailed(withError error: Error)
    
}
