//
//  MovieListRouterImplTests.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 01/01/2018.
//  Copyright © 2018 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MovieListRouterImplTests: XCTestCase {
    
    func test_router_createMovieListModule_returnsMoviesViewController() {
        
        let viewController = MovieListRouterImpl.createMovieListModule()
        
        let mirror = Mirror(reflecting: viewController)
        
        guard mirror.subjectType == MoviesViewController.self else { XCTFail(); return }
        
    }
    
}
