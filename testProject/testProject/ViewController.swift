//
//  ViewController.swift
//  testProject
//
//  Created by Mariya Arul Raj on 24/11/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var name1 = ""
    var name2 = ""
    
    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func Add(_ sender: Any) {
        name1 = number1.text!
        name2 = number2.text!
        result.text = name1 + " " + name2
    }
    
}

