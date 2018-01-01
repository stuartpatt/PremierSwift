//
//  MovieListInteractorTests.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MovieListInteractorTests: XCTestCase {
    
    var interactor: MovieListInteractorImpl!
    var useCase: MockMovieListUseCase!
    
    var outputMovies: [Movie]?
    var outputError: Error?
    
    override func setUp() {
        
        super.setUp()
        
        useCase = MockMovieListUseCase()
        
        interactor = MovieListInteractorImpl(useCase: useCase)
        
    }
    
    func test_interactor_fetchMovies_callsMovies_onUseCase() {
    
        //Given
        useCase.moviesResponse = .error(MockError.movieListInteractorMockError)
        
        //When
        interactor.fetchMovies()
        
        //Then
        XCTAssertTrue(useCase.moviesWasCalled)
        
    }
    
    func test_interactor_fetchMovies_returnsNonEmptyResult_inOutput_forUseCaseSuccess() {
        
        //Given
        let movie = getMockMovie()
        
        useCase.moviesResponse = .success([movie])
        
        interactor.output = self
        
        //When
        interactor.fetchMovies()
        
        //Then
        XCTAssertNotNil(outputMovies)
        
    }
    
    func test_interactor_fetchMovies_returnsReceivedMovies_inOutput_forUseCaseSuccess() {
        
        //Given
        let movie = getMockMovie()
        
        useCase.moviesResponse = .success([movie])
        
        interactor.output = self
        
        //When
        interactor.fetchMovies()
        
        //Then
        XCTAssertEqual(outputMovies?.first?.vote_count, movie.vote_count)
        XCTAssertEqual(outputMovies?.first?.id, movie.id)
        XCTAssertEqual(outputMovies?.first?.video, movie.video)
        XCTAssertEqual(outputMovies?.first?.title, movie.title)
        XCTAssertEqual(outputMovies?.first?.popularity, movie.popularity)
        XCTAssertEqual(outputMovies?.first?.poster_path, movie.poster_path)
        XCTAssertEqual(outputMovies?.first?.original_language, movie.original_language)
        XCTAssertEqual(outputMovies?.first?.original_title, movie.original_title)
        XCTAssertEqual(outputMovies?.first?.backdrop_path, movie.backdrop_path)
        XCTAssertEqual(outputMovies?.first?.adult, movie.adult)
        XCTAssertEqual(outputMovies?.first?.overview, movie.overview)
        
    }
    
    func test_interactor_fetchMovies_returnsError_inOutput_forUseCaseFailure() {
        
        //Given
        useCase.moviesResponse = .error(MockError.movieListInteractorMockError)
        
        interactor.output = self
        
        //When
        interactor.fetchMovies()
        
        //Then
        XCTAssertEqual(outputError?.localizedDescription, MockError.movieListInteractorMockError.localizedDescription)
        
    }
    
    private enum MockError: Error {
        
        case movieListInteractorMockError
        
    }
    
    private func getMockMovie() -> Movie {
        
        return Movie(vote_count: 1,
                     id: 42,
                     video: true,
                     vote_average: 9.3,
                     title: "Mock Title",
                     popularity: 8.1,
                     poster_path: "https://somemockurl.com",
                     original_language: "en",
                     original_title: "The same mock title",
                     genre_ids: [2,4,6,8],
                     backdrop_path: "https://somemockurl.com",
                     adult: true,
                     overview: "Yeah not bad")
        
    }
    
}

extension MovieListInteractorTests: MovieListInteractorOutput {
    
    func moviesFetched(_ movies: [Movie]) {
        
        outputMovies = movies
        
    }
    
    func movieFetchFailed(withError error: Error) {
        
        outputError = error
        
    }
    
}
