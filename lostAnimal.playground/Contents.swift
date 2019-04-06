import UIKit

//let array1 = ["dog", "cat", "bird", "pig"]
//let array2 = ["turtle", "snake", "lizard", "shark", "elephant"]

// my Function to search for an animal in the given arrays
//
// func findAnimal(a: String){
//
//    for index in 0...array1.count-1 {
//        if (a == array1[index]) {
//            print("\(a) is in array1")
//        }
//    }
//
//    for index in 0...array2.count-1 {
//        if (a == array2[index]) {
//            print("\(a) is in array2")
//        }
//    }
//}
//
//findAnimal(a: "pig")


// an alternate method to find an animal in given arrays
//
//func findAnimal(animalToFind: String) -> Bool {
//
//    for animal in array1 {
//        if animal.lowercased() == animalToFind.lowercased() {
//            return true
//        }
//    }
//
//    for animal in array2 {
//        if animal.lowercased() == animalToFind.lowercased(){
//            return true
//        }
//    }
//    return false
//}
//
//var animalName = "CAT"
//var animalFound = findAnimal(animalToFind: animalName)
//
//if (animalFound){
//    print ("\(animalName) is found in given arrays")
//}else {
//    print ("\(animalName) is not found in given arrays")
//}


// a better alternate to find an animal in given arrays

//func findAnimal(animalToFind: String) -> Bool {
//
//    let array3 = array1 + array2
//
//    for animal in array3 {
//        if animal.lowercased() == animalToFind.lowercased() {
//            return true
//        }
//    }
//    return false
//}
//
//let animalName = "Pig"
//var animalFound = findAnimal(animalToFind: animalName)
//if animalFound{
//    print("\(animalName) is found in given arrays")
//}else {
//    print("\(animalName) is not found in givne arrays")
//}


let age = 80

switch age {
case 1:
    print("Happy first Birthday!")

case 12...19:
    print("Happy Birthday teenager!")
    
case let decade where age % 10 == 0:
    print("Happy significant \(decade)th Birthday!")
    
default:
    print("Happy Birthday my dear!")
}
