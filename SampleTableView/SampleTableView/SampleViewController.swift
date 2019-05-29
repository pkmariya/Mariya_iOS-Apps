//
//  ViewController.swift
//  SampleTableView
//
//  Created by Mariya Arul Raj on 25/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class SampleViewController: UITableViewController {

    var personNames = ["Mariya", "Preeths", "Ruby"]
    let placeNames = ["Coimbatore", "Chennai", "California", "Singapore"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //MARK: Number of rows per section
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return personNames.count
        } else {
            return placeNames.count
        }
    }
    
    //MARK: Contents of Rows
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.indentationLevel = 3
        
        if indexPath.section == 0 {
            let personName = personNames[indexPath.row]
            cell.textLabel?.text = personName
        } else {
            let placeName = placeNames[indexPath.row]
            cell.textLabel?.text = placeName
        }
        return cell
    }
    
    //MARK: Row selection indicator with checkmark flash deselection
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: title for Sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            title = "People"
        } else {
            title = "Places"
        }
        return title
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var newText = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (ACTION) in
            self.personNames.append(String(newText.text!))
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            if(alertTextField.text != nil){
                newText = alertTextField
            } else {
                print("Please enter a new name")
            }
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

