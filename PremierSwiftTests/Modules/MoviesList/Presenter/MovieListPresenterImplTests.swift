//
//  MovieListPresenterImplTests.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MovieListPresenterImplTests: XCTestCase {
    
    var presenter: MovieListPresenterImpl!
    
    var view: MockMovieListView?
    var interactor: MockMovieListInteractor!
    
    override func setUp() {
        
        super.setUp()
        
        view = MockMovieListView()
        
        interactor = MockMovieListInteractor()
        
        presenter = MovieListPresenterImpl(interactor: interactor, view: view)
        
        interactor.output = presenter
        
    }
    
    func test_presenter_viewDidLoad_callsFetchMovies_onInteractor() {
        
        //Given
        let movie = getMockMovie()
        
        interactor.fetchMoviesResponse = .success([movie])

        //When
        presenter.viewDidLoad()
        
        //Then
        XCTAssertTrue(interactor.fetchMoviesWasCalled)
        
    }
    
    func test_presenter_viewDidLoad_passesReceivedMovies_toView() {
        
        //Given
        let movie = getMockMovie()
        
        interactor.fetchMoviesResponse = .success([movie])
        
        //When
        presenter.viewDidLoad()
        
        //Then
        XCTAssertEqual(view?.receivedMovies?.first?.vote_count, movie.vote_count)
        XCTAssertEqual(view?.receivedMovies?.first?.id, movie.id)
        XCTAssertEqual(view?.receivedMovies?.first?.video, movie.video)
        XCTAssertEqual(view?.receivedMovies?.first?.title, movie.title)
        XCTAssertEqual(view?.receivedMovies?.first?.popularity, movie.popularity)
        XCTAssertEqual(view?.receivedMovies?.first?.poster_path, movie.poster_path)
        XCTAssertEqual(view?.receivedMovies?.first?.original_language, movie.original_language)
        XCTAssertEqual(view?.receivedMovies?.first?.original_title, movie.original_title)
        XCTAssertEqual(view?.receivedMovies?.first?.backdrop_path, movie.backdrop_path)
        XCTAssertEqual(view?.receivedMovies?.first?.adult, movie.adult)
        XCTAssertEqual(view?.receivedMovies?.first?.overview, movie.overview)

    }
    
    func test_presenter_viewDidLoad_passesReceivedError_toView() {
        
        //Given
        interactor.fetchMoviesResponse = .error(MockError.movieListPresenterMockError)
        
        //When
        presenter.viewDidLoad()
        
        //Then
        XCTAssertEqual(view?.receivedError?.localizedDescription, MockError.movieListPresenterMockError.localizedDescription)
        
    }
    
    func test_presenter_viewDidLoad_receivesNoDelegateCallbacks_whenUnsassigned() {
        
        //Given
        interactor.output = nil
        
        let movie = getMockMovie()
        
        interactor.fetchMoviesResponse = .success([movie])
        
        //When
        presenter.viewDidLoad()
        
        //Then
        XCTAssertNil(view?.receivedError)
        XCTAssertNil(view?.receivedMovies)
        
    }
    
    //MARK: Test Helpers
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
    
    private enum MockError: Error {
        
        case movieListPresenterMockError
        
    }
    
}
