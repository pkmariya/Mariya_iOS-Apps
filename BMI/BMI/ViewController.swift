//
//  ViewController.swift
//  BMI
//
//  Created by Mariya Arul Raj on 06/01/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weightInputValue:Double = 0
    var heightInputValue:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findBMI(_ sender: UIButton) {
        weightInputValue = Double(weightInput.text!)!
        heightInputValue = Double(heightInput.text!)!
        
        var bmiValue:Double = weightInputValue / pow(heightInputValue, 2)
        if (bmiValue > 25) {
            resultLabel.text = "Your BMI is: \(bmiValue), and you are Over Weight"
        } else if (bmiValue > 18.5 && bmiValue < 25) {
            resultLabel.text = "Your BMI is: \(bmiValue), and you have normal weight"
        }else if (bmiValue < 18.5){
            resultLabel.text = "Your BMI is: \(bmiValue), and you are underweight"
        }
        resultLabel.text = "Your BMI is: \(bmiValue)"
    }
}

