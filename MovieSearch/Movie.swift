//
//  Movie.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 7/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

struct Movie {
    private let kTitle = "original_title"
    private let kRating = "vote_average"
    private let kSummary = "overview"
    private let kPoster = "poster_path"
    private let kMovie = "movie"
    
    let name: String
    let rating: Float
    let summary: String
    let poster: UIImage
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kTitle] as? String else {return nil}
        
        guard let rating = dictionary[kRating] as? Float else {return nil}
        
        guard let summary = dictionary[kSummary] as? String else {return nil}
        
        guard let poster = dictionary[kPoster] as? UIImage else {return nil}
        
        self.name = name
        self.rating = rating
        self.summary = summary
        self.poster = poster
        
    }
}
