//
//  Movie.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 8/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Movie {
    
    private let kTitle = "original_title"
    private let kRating = "vote_average"
    private let kOverview = "overview"
    private let kPoster = "poster_path"
    
    let title: String
    let rating: Float
    let overview: String
    let imageEndPoint: String
    
    init?(jsonDictionary: [String: AnyObject]) {
        guard let title = jsonDictionary[kTitle] as? String,
        let rating = jsonDictionary[kRating] as? Float,
        let overview = jsonDictionary[kOverview] as? String,
            let imageEndPoint = jsonDictionary[kPoster] as? String else { return nil }
        
        self.title = title
        self.rating = rating
        self.overview = overview
        self.imageEndPoint = imageEndPoint
    }
}
