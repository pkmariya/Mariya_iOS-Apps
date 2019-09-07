//
//  ViewController.swift
//  testMVC
//
//  Created by Mariya Arul Raj on 02/06/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class TestMVCViewController: UITableViewController {

    var namesList = [NamesClass]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Names.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadNames()
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = namesList[indexPath.row]
        
        cell.indentationLevel = 3
        cell.textLabel?.text = namesList[indexPath.row].title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        namesList[indexPath.row].done = !namesList[indexPath.row].done
        self.saveNames()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var newName = UITextField()
        
        let alert = UIAlertController(title: "Create New Name", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Name", style: .default) { (action) in
            let addName = NamesClass()
            addName.title = newName.text!
            self.namesList.append(addName)
            self.saveNames()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a New Name"
            newName = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveNames() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(namesList)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding names list \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadNames() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
        let decoder = PropertyListDecoder()
        
        do {
            namesList = try decoder.decode([NamesClass].self, from: data)
        } catch {
            print("Error decoding names list \(error)")
        }
    }
    }
}
