//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 7/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateWithMovies (movie: Movie) {
        nameLabel.text = movie.name
        ratingLabel.text = "\(movie.rating) out of 10"
        summaryLabel.text = movie.summary
        posterImage.image = movie.poster

    }
  

}
