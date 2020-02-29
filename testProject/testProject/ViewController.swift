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
        let myLabel = UILabel()
 //       myLabel.frame = CGRect(x: 50, y: 50, width: 350, height: 50)
        myLabel.text = "This label is created thro code!"
  //      myLabel.textColor = UIColor.cyan
        myLabel.textColor = UIColor(red: 0.0, green: 0.0004, blue: 0.502, alpha: 1.0)
        view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70).isActive = true
        myLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
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

