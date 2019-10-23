//
//  ViewController.swift
//  Friendface
//
//  Created by Matt Crowder on 10/21/19.
//  Copyright © 2019 Matt Crowder. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    let dataSource = FriendDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
            
        }
        
        dataSource.fetch("https://www.hackingwithswift.com/samples/friendface.json")
        tableView.dataSource = dataSource
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        dataSource.filterText = searchController.searchBar.text
    }
    
}

