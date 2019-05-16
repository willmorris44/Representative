//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Will morris on 5/16/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        RepresentativeController.searchRepresentatives(forState: state!) { (representatives) in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.representatives = representatives
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? RepresentativeTableViewCell

        let representative = representatives[indexPath.row]
        cell?.updateViews(representative: representative)
        
        return cell ?? UITableViewCell()
    }
}
