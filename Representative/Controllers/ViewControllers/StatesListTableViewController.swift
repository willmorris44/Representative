//
//  StatesListTableViewController.swift
//  Representative
//
//  Created by Will morris on 5/16/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class StatesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return State.states.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = State.states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            if let index = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? StateDetailTableViewController else { return }
                let state = State.states[index.row]
                destinationVC.state = state
            }
        }
    }
}
