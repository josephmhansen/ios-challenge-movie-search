//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Joseph Hansen on 8/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    var movies = [Movie]()
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        MovieController.fetchMovies(searchTerm) { (movies) in
            self.movies = movies
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.tableView.reloadData()
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell
        
        cell?.updateWithMovie(movies[indexPath.row])
        

        // Configure the cell...

        return cell ?? UITableViewCell()
    }

}
