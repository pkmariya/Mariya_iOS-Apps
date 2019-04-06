//
//  ViewController.swift
//  Receipe1
//
//  Created by Mariya Arul Raj on 16/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let array = ["Caroline", "Mariya", "Preeths"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage(named: "breads"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0.5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell") as! customcell
        
        if(indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clear
        }
        else {
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = array[indexPath.item]
        cell.Receipe = cell.textLabel?.text
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailview"){
            let cell = sender as! customcell
            let detailview = segue.destination as! DetailViewController
            detailview.preRecipe = cell.Receipe
        }
    }

}

