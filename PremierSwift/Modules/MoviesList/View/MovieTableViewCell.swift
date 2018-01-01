//
//  MovieTableViewCell.swift
//  PremierSwift
//
//  Created by Stuart Pattison on 01/01/2018.
//  Copyright © 2018 Deliveroo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    func configureWith(movie: Movie) {

        movieTitleLabel.font = UIFont.title
        
        movieTitleLabel.textColor = UIColor.titleText
        
        movieTitleLabel.text = movie.title
        
        movieDescription.font = UIFont.body
        
        movieDescription.textColor = UIColor.bodyText
        
        movieDescription.text = movie.overview
        
        let imageResourceString = "https://image.tmdb.org/t/p/w370_and_h556_bestv2" + movie.poster_path
        
        let imageURL = URL(string: imageResourceString)
        
        let placeholder = UIImage(named: "placeholder")
     
        movieImageView.kf.setImage(with: imageURL, placeholder: placeholder)
        
    }
    
}
