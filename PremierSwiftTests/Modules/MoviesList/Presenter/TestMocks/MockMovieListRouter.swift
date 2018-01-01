//
//  MockMovieListRouter.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 01/01/2018.
//  Copyright © 2018 Deliveroo. All rights reserved.
//

import Foundation
import UIKit

@testable import PremierSwift
class MockMovieListRouter: MovieListRouter {
    
    static func createMovieListModule() -> UIViewController {
    
        return UIViewController()
        
    }
    
}
