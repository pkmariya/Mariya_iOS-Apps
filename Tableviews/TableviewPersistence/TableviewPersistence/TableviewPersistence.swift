//
//  ViewController.swift
//  TableviewPersistence
//
//  Created by Mariya Arul Raj on 29/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class TableviewPersistence: UITableViewController {

    var namesList = ["Mariya", "Preeths", "Ruby", "Infant", "Philo"]
    
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let names = defaults.array(forKey: "MyContacts") as? [String] {
            namesList = names
        }
    }

    //Datasource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.indentationLevel = 3
        cell.textLabel?.text = namesList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Contacts"
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newText = UITextField()
        
        let alert = UIAlertController(title: "Create New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.namesList.append(newText.text!)
            
            self.defaults.set(self.namesList, forKey: "MyContacts")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Name"
            newText = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
