//
//  MoviesResultTests.swift
//  PremierSwiftTests
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation
import XCTest

@testable import PremierSwift
class MovieResultTests: XCTestCase {
    
    func test_movieResult_jsonDecoder_returnsValues_forRealJSON() throws {
     
        //Given
        let movieResultData = try data(forJSONFileNamed: "movie_result.json")
        
        let decoder = JSONDecoder()
        
        //When
        let movieResult = try decoder.decode(MovieResult.self, from: movieResultData)
        
        //Then
        XCTAssertEqual(movieResult.page, 1)
        XCTAssertEqual(movieResult.total_results, 7786)
        XCTAssertEqual(movieResult.total_pages, 390)
        XCTAssertEqual(movieResult.results.count, 1)
        
    }
    
}
