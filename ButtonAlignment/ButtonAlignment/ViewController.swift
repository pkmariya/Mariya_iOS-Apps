//
//  ViewController.swift
//  ButtonAlignment
//
//  Created by Mariya Arul Raj on 23/02/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloworldButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        helloworldButton.setTitle("Flash Light", for: .normal)
    }
/*
    @IBAction func helloworldButtonPressed(_ sender: Any) {
        view.backgroundColor = .cyan
    }
    
    @IBAction func yellowButtonPressed(_ sender: Any) {
        view.backgroundColor = .yellow
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        view.backgroundColor = .green
    }
 */
    @IBAction func buttonPressed(_ sender: UIButton) {
        var selectedButton = "";
        selectedButton = sender.titleLabel?.text as! String
        print("Selected Button is \(selectedButton)")
        if selectedButton == "Yellow" {
            view.backgroundColor = .yellow
        }
        else if selectedButton == "Flash Light" {
            view.backgroundColor = .cyan
        }
        else if selectedButton == "Green" {
            view.backgroundColor = .green
        }
    }
}

