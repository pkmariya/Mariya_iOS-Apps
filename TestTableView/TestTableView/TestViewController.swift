//
//  ViewController.swift
//  TestTableView
//
//  Created by Mariya Arul Raj on 25/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class TestViewController: UITableViewController {

    var myArrayList = ["Mariya", "Preeths", "Ruby"]
    var secondArray = ["Coimbatore", "Singapore", "Chennai", "California"]
    var defaults = UserDefaults.standard
    let namesArrayKey = "myContacts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let names = defaults.array(forKey: namesArrayKey) as? [String] {
            myArrayList = names
        }
    }

    //MARK - Tableview Datasource Methods
    
    // Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myArrayList.count
        } else {
            return secondArray.count
        }
    }
    
    // Contents of each row
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        cell.indentationLevel = 5
        
        if indexPath.section == 0 {
            var personName = myArrayList[indexPath.row]
            cell.textLabel?.text = personName
        } else {
            var placeName = secondArray[indexPath.row]
            cell.textLabel?.text = placeName
        }
        return cell
    }
    
    //MARK: adding Checkmark for selection
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
     tableView.cellForRow(at: indexPath)?.accessoryType = .none
     } else {
     tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
     }
     
     tableView.deselectRow(at: indexPath, animated: true)
     }
    */
    // Give title to each section in the Table View
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "People"
        } else {
            return "Places"
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newText = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.myArrayList.append(newText.text!)
            self.defaults.setValue(self.myArrayList, forKey: self.namesArrayKey)
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

