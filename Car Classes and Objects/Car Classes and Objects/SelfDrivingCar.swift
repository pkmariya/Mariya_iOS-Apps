//
//  SelfDrivingCar.swift
//  Car Classes and Objects
//
//  Created by Mariya Arul Raj on 09/02/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    var destination : String?
    
    override func drive() {
        super.drive()
        destination = "1 Infinite Loop"
        // option binding example code given below
        if let userSetDestination = destination {
            print("driving to " + userSetDestination)
        }
        else {
            print("Desitination is not set")
        }
    }
}
