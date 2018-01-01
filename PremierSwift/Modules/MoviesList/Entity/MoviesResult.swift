//
//  MoviesResult.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 29/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

struct MovieResult: Codable {
    
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
    
}
