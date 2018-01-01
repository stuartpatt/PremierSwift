//
//  MovieListRouterImpl.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 01/01/2018.
//  Copyright © 2018 Deliveroo. All rights reserved.
//

import Foundation
import UIKit

struct MovieListRouterImpl: MovieListRouter {
    
    static func createMovieListModule() -> UIViewController {
        
        let serviceFactory = PrimaryServiceFactory.serviceFactory()
        
        let useCase = serviceFactory.movieListUseCase()
        
        let view = MoviesViewController()
        
        let interactor = MovieListInteractorImpl(useCase: useCase)
        
        let router = MovieListRouterImpl()
        
        let presenter = MovieListPresenterImpl(interactor: interactor, view: view, router: router)
        
        interactor.output = presenter
        
        view.configureWith(presenter: presenter)
        
        return view
    
    }
    
}
