//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Francisco Olvera on 24/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    // MARK: - Methods
    func configure(with movie: Movie) {
        if let image = movie.image{
                imageViewPoster.image = UIImage(named: image)
        } else {
            imageViewPoster.image = nil
        }
        //imageViewPoster.image = UIImage(named: movie.image ?? "placeholder")
        
        labelTitle.text = movie.title
        labelSummary.text = movie.summary
        labelRating.text = movie.ratingFormatted
    }

}
