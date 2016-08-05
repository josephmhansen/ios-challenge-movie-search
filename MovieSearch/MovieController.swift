//
//  MovieController.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 8/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController{
    static let baseURL = NSURL(string:"http://api.themoviedb.org/3")
    static let apiKey = "39b3b8ccedabe0c9373ba3b32a814d13"
    static var endpoint = MovieController.baseURL?.URLByAppendingPathComponent("/search/movie")
    
    static func fetchMovies(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        guard let url = endpoint else {
            print("Error: No url found")
            completion(movies: [])
            return
        }
        
        let urlParameters = ["api_key" : "\(apiKey)", "query":"\(searchTerm)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data,
                let responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else {
                    print("error: no data found")
                    completion(movies: [])
                    return
            }
            
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                let resultsArray = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    print("error: issue serializing json \(responseDataString)")
                    completion(movies: [])
                    return
            }
           
            var movies = [Movie]()
            
            for resultDictionary in resultsArray {
                if let movie = Movie(jsonDictionary: resultDictionary) {
                    movies.append(movie)
                }
            }
            
            completion(movies: movies)
            return
            
        }
    }
    
}
