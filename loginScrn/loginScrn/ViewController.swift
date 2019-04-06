//
//  ViewController.swift
//  loginScrn
//
//  Created by Mariya Arul Raj on 02/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBAction func sliderMove(_ sender: UISlider) {
        let sliderValue = lroundf(sender.value)
        sliderLabel.text = "\(sliderValue)"
    }
    
    @IBAction func segmentToggle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            sliderLabel.text = "private"
        }
        else if sender.selectedSegmentIndex == 1 {
            sliderLabel.text = "public"
        }
    }
    
}

