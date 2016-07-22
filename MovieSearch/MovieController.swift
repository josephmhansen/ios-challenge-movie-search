//
//  MovieController.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 7/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    static let kAPI = "fcedae6df8b745c907e0a0120d9892e6"
    static let baseURL = NSURL(string: "https://api.themoviedb.org/3/movie")
    
    static func getMovie(movieName: Int, completion: (movie: Movie?) -> Void) {
        guard let url = baseURL else {
            completion(movie: nil)
            return
        }
        let urlParameters = ["api_key": kAPI, "query" : "\(movieName)"]
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                    completion(movie: nil)
                    return
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let movie = Movie(dictionary: jsonDictionary)
                completion(movie: movie)
            })
        }
    }
}
