//
//  Car.swift
//  Car Classes and Objects
//
//  Created by Mariya Arul Raj on 09/02/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import Foundation

enum CarType {
        case Sedan
        case SUV
        case Hatchback
}

class Car {
    var colour = "Black"
    var numberOfSeats = 5
    var typeOfCar: CarType = .Sedan
    
    init() {
        
    }
    
    convenience init(customColor: String, customSeats: Int, customCarType: CarType) {
        self.init()
        colour = customColor
        numberOfSeats = customSeats
        typeOfCar = customCarType
    }
    
    func drive()  {
        print("car is driving")
    }
}
