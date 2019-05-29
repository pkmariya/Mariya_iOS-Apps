//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Mariya Arul Raj on 28/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {

    var namesList = ["Mariya", "Preeths", "Ruby", "Infant", "Philo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Datasource Methods
    
    //MARK: Number of Sections in Tableview
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: Number of Rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }
    
    //MARK: Contents of rows in Tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.indentationLevel = 3
        cell.textLabel?.text = namesList[indexPath.row]
        return cell
    }
    
    //MARK: adding checkmark and selection/deselection animation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Title for each Section
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        title = "My Contacts"
        return title
    }
}

