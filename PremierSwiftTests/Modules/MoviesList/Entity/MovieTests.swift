//
//  MovieTests.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MovieTest: XCTestCase {
    
    func test_movie_jsonDecoder_returnsValues_forRealJSON() throws {
        
        //Given
        let movieData = try data(forJSONFileNamed: "movie.json")
        
        let decoder = JSONDecoder()
        
        //When
        let movie = try decoder.decode(Movie.self, from: movieData)
        
        //Then
        XCTAssertEqual(movie.vote_count, 932)
        XCTAssertEqual(movie.id, 19404)
        XCTAssertEqual(movie.video, false)
        XCTAssertEqual(movie.vote_average, 9.1)
        XCTAssertEqual(movie.title, "Dilwale Dulhania Le Jayenge")
        XCTAssertEqual(movie.popularity, 48.677917)
        XCTAssertEqual(movie.poster_path, "/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg")
        XCTAssertEqual(movie.original_language, "hi")
        XCTAssertEqual(movie.original_title, "Dilwale Dulhania Le Jayenge")
        XCTAssertEqual(movie.genre_ids, [35,18,10749])
        XCTAssertEqual(movie.backdrop_path, "/nl79FQ8xWZkhL3rDr1v2RFFR6J0.jpg")
        XCTAssertEqual(movie.adult, false)
        XCTAssertEqual(movie.overview, "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.")
        
    }
    
}
