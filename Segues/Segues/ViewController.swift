//
//  ViewController.swift
//  Segues
//
//  Created by Mariya Arul Raj on 13/04/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, sendDataBack {
    
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBOutlet weak var firstViewTextField: UITextField!
    
    var firstData = "Initial Label"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstViewLabel.text = firstData
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.data = firstViewTextField.text!
            
            secondVC.delegate = self
        }
    }
    
    func dataSent(data: String) {
        firstViewLabel.text = data
    }
}

