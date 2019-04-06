import UIKit

var str = "Hello, playground"
var name = " "

func sayHello(_ name:String) {
    print("Hello \(name), how are you?")
}

sayHello("Mariya Preeths")


// Function with return value

func addFourTo(_ x: Int) -> Int {
    return x+4
}

print("6 plus 4 is: \(addFourTo(6))")
