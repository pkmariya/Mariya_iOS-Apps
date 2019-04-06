//
//  CalculatorBrain.swift
//  myCalc
//
//  Created by Mariya Arul Raj on 22/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation (symbol: String){
        switch symbol {
        case "PI":
            accumulator = Double.pi
        case "Sq":
            accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}

