//
//  ViewController.swift
//  IndianCricketTeam
//
//  Created by Mariya Arul Raj on 24/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var players = ["Shikhar", "Rohit", "Kohli", "Rahanae", "Dhoni", "Jadeja", "Ashwin", "Bumra", "Bhuvanesh", "Ishant", "Shami"]
    
    // Number of Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of Rows per section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    // Contents of Rows
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: playerCell=tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! playerCell

        cell.playerImage.image = UIImage(named: self.players[indexPath.row])
        cell.playerName.text = self.players[indexPath.row]
   
        return cell
    }
    
    // Row selection highlight and disappear (selection flash) and to mark selection with Checkmark
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // title for section
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            title = "Indian Players"
        } else
        {
            print("No Players")
        }
        return title
    }
}

