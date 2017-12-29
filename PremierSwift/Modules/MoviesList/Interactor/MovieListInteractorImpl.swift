//
//  MovieListInteractorImpl.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import RxSwift

class MovieListInteractorImpl: MovieListInteractor {
    
    let useCase: MovieListUseCase!
    var output: MovieListInteractorOutput?
    
    private let bag = DisposeBag()
    
    required init(useCase: MovieListUseCase) {
        
        self.useCase = useCase
        
    }
    
    func fetchMovies() {
        
        useCase.movies().subscribe(onNext: { [weak self] movies in
            
            self?.output?.moviesFetched(movies)
            
            }, onError: { [weak self] error in
                
                self?.output?.movieFetchFailed(withError: error)
                
        })
        .disposed(by: bag)
        
    }
    
}
