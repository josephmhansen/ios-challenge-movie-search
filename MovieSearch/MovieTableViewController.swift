//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 7/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate {
 

    var moviesArray: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MovieController.getMovie{ (movies) in
//            self.moviesArray = movies
        
    }
    
    
   
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {
            return
        }
        searchBar.resignFirstResponder()
        MovieController.getMovie(searchTerm) { (movie) in
//            guard let movie = Movie? else {return}
            self.moviesArray = movie
            
            
         
        }
    }
    

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.moviesArray.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)
        let movie = moviesArray[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = movie.name

        return cell
    }
    


}
