//
//  ViewController.swift
//  myCalc
//
//  Created by Mariya Arul Raj on 22/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // top display label
    @IBOutlet private weak var display: UILabel!
    
    // to refresh/append the display label based on where user entry is
    private var userInTheMiddleOfTyping = false
    
    // Action on digit button press
    @IBAction private func pressDigit(_ sender: UIButton) {
        let digitPressed = sender.currentTitle!
        
        if userInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digitPressed
        }else {
            display.text = digitPressed
        }
        userInTheMiddleOfTyping = true
    }
    
    // this is to generalize casting and avoid individual type casting back n forth String to Double  in methods
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    // Action on math operation button press
    @IBAction private func performOperation(_ sender: UIButton) {
        if userInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}

