import UIKit

func greetings(){
    print("hi, good morning!")
}

greetings()

func printTotalWithTax(subTotal: Double){
    print("this is from printTotalWithTax Function \(subTotal * 1.13)")
}

printTotalWithTax(subTotal: 10)

func getTotalWithTax(subTotal: Double) -> Double{
    return subTotal * 1.13
}

print("this is from getTotalWithTax Function \(getTotalWithTax(subTotal: 10))")

func calculateTotalWithTax(subTotal: Double, tax: Double) -> Double{
    return subTotal * tax
}

print("this is from calculateTotalWithTax Function \(calculateTotalWithTax(subTotal: 10, tax: 1.13))")
