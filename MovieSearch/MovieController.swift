//
//  MovieController.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 7/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    static let kAPI = "39b3b8ccedabe0c9373ba3b32a814d13"
    static let baseURL = NSURL(string: "https://api.themoviedb.org/3/movie")
    
    static func getMovie(movieName: String, completion: (movies: [Movie]) -> Void) {
        guard let url = baseURL else {
            completion(movies: [])
            return
        }
        let urlParameters = ["api_key": kAPI, "query" : "\(movieName)"]
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
            let movieDictionaries = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    completion(movies: [])
                    return
            }
        
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let movies = movieDictionaries.flatMap ({Movie(dictionary: $0)})
                completion(movies: movies)
            })
        }
    }
}
