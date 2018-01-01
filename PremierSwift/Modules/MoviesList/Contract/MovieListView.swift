//
//  MovieListView.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

protocol MovieListView {
    
    func showMovieList(_ movies: [Movie])
    
    func showFetchError(_ error: Error)
    
}
