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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: playerCell=tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! playerCell
        cell.playerImage.image = UIImage(named: self.players[indexPath.row])
        cell.playerName.text = self.players[indexPath.row]
        
        return cell
    }
}

