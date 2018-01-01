//
//  MovieListPresenterImpl.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

class MovieListPresenterImpl: MovieListPresenter {
    
    var view: MovieListView?
    var interactor: MovieListInteractor!
    var router: MovieListRouter?
    
    required init(interactor: MovieListInteractor, view: MovieListView?, router: MovieListRouter?) {
        
        self.interactor = interactor
        
        self.view = view
        
        self.router = router
        
    }
    
    func viewDidLoad() {
        
        interactor.fetchMovies()
        
    }
    
}

extension MovieListPresenterImpl: MovieListInteractorOutput {
    
    func moviesFetched(_ movies: [Movie]) {
        
        view?.showMovieList(movies)
        
    }
    
    func movieFetchFailed(withError error: Error) {
        
        view?.showFetchError(error)
        
    }
    
}
