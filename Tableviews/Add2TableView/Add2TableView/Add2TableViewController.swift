//
//  ViewController.swift
//  Add2TableView
//
//  Created by Mariya Arul Raj on 28/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class Add2TableViewController: UITableViewController {

    var namesList = ["Mariya", "Preeths", "Ruby", "Infant", "Philo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Datasource Methods
    
    //MARK: Number of sections in tableview
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: Number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }
    
    //MARK: Contents of each row in tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.indentationLevel = 3
        cell.textLabel?.text = namesList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType) == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Section title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "My Contacts"
        return title
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newText = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user clicks add item button
            self.namesList.append(newText.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            newText = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


