//
//  MovieListPresenter.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 31/12/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

protocol MovieListPresenter {
    
    var view: MovieListView? { get set }
    
    func viewDidLoad()
    
}
