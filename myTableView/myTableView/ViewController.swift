//
//  ViewController.swift
//  myTableView
//
//  Created by Mariya Arul Raj on 02/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let people = [
        ("Mariya", "Coimbatore"),
        ("Preeths", "Chennai"),
        ("Ruby", "Bangalore")
    ]
    
    let videos = [
        ("Android App Development", "74 videos"),
        ("C++ for Experts", "87 videos"),
        ("iOS App Development", "42 videos"),
        ("Python Programming", "63 videos"),
        ("Web Design", "68 videos")
    ]
    
    // Number of Sections in the Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // Nunmber of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return people.count
        }
        else {
            return videos.count
        }
    }
    
    // Contents of each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            var (personName, personLocation) = people[indexPath.row]
            cell.textLabel?.text = personName
        }else {
            var (videoTitle, videoDesc) = videos[indexPath.row]
            cell.textLabel?.text = videoTitle
        }
        return cell
    }
    
    // Give title to each section in the Table View
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "People"
        }else {
            return "Videos"
        }
    }
}

