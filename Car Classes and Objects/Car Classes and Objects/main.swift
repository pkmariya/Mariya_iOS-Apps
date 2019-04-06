//
//  main.swift
//  Car Classes and Objects
//
//  Created by Mariya Arul Raj on 09/02/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import Foundation

let myCar = Car()

print(myCar.colour)
print(myCar.numberOfSeats)
print(myCar.typeOfCar)
print()
print("Here comes a Luxury Car Configuration")


let RichCar = Car(customColor: "Red", customSeats: 6, customCarType: CarType.Hatchback)

print(RichCar.colour)
print(RichCar.numberOfSeats)
print(RichCar.typeOfCar)

let mySelfDrivingCar = SelfDrivingCar()

mySelfDrivingCar.colour = "Diamond White"
print("Color of self driving car is: \(mySelfDrivingCar.colour)")
mySelfDrivingCar.drive()

