//
//  MovieListRemote.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import RxSwift

struct MovieListRemote: MovieListUseCase {
    
    let networkService: NetworkService!
    let decoder: JSONDecoder!
    
    func movies() -> Observable<[Movie]> {
        
        //TODO: This should not remain here with the API key available
        let moviesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")!
        
        let request = URLRequest(url: moviesURL)
        
        return networkService.dataTask(forRequest: request)
        
            .flatMap { data -> Observable<[Movie]> in
                
                let response = try self.decoder.decode(MovieResult.self, from: data)
                
                return Observable.of(response.results)
                
            }

        
    }
    
}
