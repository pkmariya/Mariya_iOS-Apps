//
//  ContactsTableViewController.swift
//  ContactsList
//
//  Created by Mariya Arul Raj on 16/03/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let contactArray = ["Mariya", "Preeths", "Ruby", "Thomas", "Nirmal", "Appa", "Amma", "Uma", "Surya"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let contact = self.contactArray[indexPath.row]
        cell.textLabel?.text = contact

        return cell
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            if let detailVC = segue.destination as? ContactDetailsViewController,
                let indexPath = self.tableView.indexPathForSelectedRow?.row {
                let contact = self.contactArray[indexPath]
                
                detailVC.contact = contact
            }
        }
    }
}
