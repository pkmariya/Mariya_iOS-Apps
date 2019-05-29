//
//  ViewController.swift
//  tempTableView
//
//  Created by Mariya Arul Raj on 25/05/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class tempTableViewController: UITableViewController {
    
    var myNameList = [Items]()
    let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Names List Count is: \(myNameList.count)")
        return myNameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.indentationLevel = 1
        
        let item = myNameList[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myNameList[indexPath.row].done = !myNameList[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            title = "Contacts List"
        } else
        {
            print("Only one Section")
        }
        return title
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newText = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Items()
            newItem.title = newText.text!

            self.myNameList.append(newItem)
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            newText = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(myNameList)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding myNames List\(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadItems(){
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            
            do {
                myNameList = try decoder.decode([Items].self, from: data)
            } catch {
                print("Error decoding myNames List \(error)")
            }
        }
    }
    
}

