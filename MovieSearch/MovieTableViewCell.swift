//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 8/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateWithMovie(movie: Movie) {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        ratingLabel.text = "Rating: \(movie.rating)"
        let imageURL = "http://image.tmdb.org/t/p/w500" + "\(movie.imageEndPoint)"
        ImageController.imageForURL(imageURL) { (image) in
           if let image = image {
                self.posterImageView.image = image
            }
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
