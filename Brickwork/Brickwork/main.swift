//
//  main.swift
//  Brickwork
//
//  Created by Pavel on 19.01.21.
//

import Foundation

// Asking the user to provide a number of rows
print("Please, provide a number of rows")

// Storing the user input of specified rows
let tableRows = Int(readLine()!)

// Creating an array of objects that represent the brick pieces, their x and y coordinates, value and whether they're occupied
var table = [[Int]]()

// Repeatedly asking the user to provide the values of the bricks n times, where n is the total number of initially specified rows
for rowNumber in 0..<tableRows! {
    
    var layer = [Int]()

    // Prompting the user for brick pieces on each layer
    print("Please, enter the elements of layer \(rowNumber + 1) out of \(tableRows!))")
    
    // Getting the user input, removing the spaces between the numbers and adding them to an array, if the user types something different than a whole number -> they'll be asked to provide such
    readLine()?.split(separator: " ").map({
        if let userInputIsNumber = Int($0) {
            layer.append(userInputIsNumber)
        }
        else{
            print("The input cannot be anything else, than a whole number")
        }
    })
    
    // Adding all the numbers into a 2d array that represents an X, Y coordinate system
    table.append(layer)
}

// Creating the object's array to store brick pieces and their "metadata"
var brickObjects = [Brick]()

// Going through each user input (brick pieces) and adding their appropriate data to an objects array
for (consecutiveInteger, elementOfTheSequence) in table.enumerated(){
    for (yCoordinate, elementOfInnerArray) in elementOfTheSequence.enumerated() {
        
        brickObjects.append(Brick(xCoordinate: consecutiveInteger,
                                  yCoordinate: yCoordinate,
                                  isOccupied: false,
                                  brickValue:elementOfInnerArray
        ))
    }
}

func giveBrickCoordinates(){


    for index in brickObjects{
        if brickObjects.contains(where: {$0.brickValue == index.brickValue && $0.xCoordinate == index.xCoordinate && index.isOccupied != true }) {

            let randomInt = Int.random(in: 0..<((brickObjects.count + 1)/2))

            // the current object that we're going through
            let value = index

            // going through the bricks objects and find the x coordinate of the current object and assign a random int from 0 to max possible
            let index2 = brickObjects.firstIndex(where: {$0.xCoordinate == value.xCoordinate && value.yCoordinate == 0})

            if value.isOccupied != true && value.xCoordinate == 0 && value.yCoordinate == 0 {

                brickObjects[index2!].xCoordinate = randomInt

            }

            let index3 = brickObjects.firstIndex(where: {index in index.xCoordinate == value.xCoordinate})
            brickObjects[index3!].yCoordinate = randomInt + 1 //problem lb


            // check if in the upper right corner and if below is free, if yes -> assign value and change status
//            let index10 = brickObjects.firstIndex(where: {$0.xCoordinate == 1 && $0.yCoordinate == brickObjects.count/2 && $0.isOccupied != true})
//            brickObjects[index10!].isOccupied = true
//            brickObjects[index10!].brickValue = index.brickValue


            let index1 = brickObjects.firstIndex(where: {index in index.isOccupied == false})
            brickObjects[index1!].isOccupied = true
            
                print("*****************")
                print("*", index.brickValue, "- x:", index.xCoordinate, "y:", index.yCoordinate, "*")
                print("*****************\n")

        }
    }
    
}

print("\nYour input: \n")

for everyObject in brickObjects{
    print("*****")
    print("*", everyObject.brickValue, "*")
    print("*****")
}

print("\nAnd the respective coordinates: \n")

print("***************")
for eachObject in brickObjects{
    print("*", "x: ", eachObject.xCoordinate, "y: ", eachObject.yCoordinate, "*")
}
print("***************")


print("\nThe system's output:\n")

giveBrickCoordinates()



//func getBrickPieces(){
//
//
//    var possibleValuesWithDuplicates = [Int]()
//
//
//    for indexOfPossibleValues in brickObjects{
//        possibleValuesWithDuplicates.append(indexOfPossibleValues.brickValue)
//    }
//
//
//    var possibleValuesClean = possibleValuesWithDuplicates.removeDuplicates()
//
//    print("these are the duplicates \(possibleValuesWithDuplicates)")
//
//    print("possible values", possibleValuesClean)
//
//
//    let input = table
//    let output = stride(from: 0, to: input.count - 1, by: 2).map{(input[$0], input[$0 + 1])}
//
//    print ("the paired values: \(output)")
//   let differences = output.map({ $0.1 != $0.0 })
//
//
//
//
//    // algorithm for creating the second layer based on the user input
//
//    for (consecutiveInteger, elementOfTheSequence) in table.enumerated(){
//        for (yCoordinate, elementOfInnerArray) in elementOfTheSequence.enumerated() {
//
//            var randomlyPickedElement = possibleValuesWithDuplicates.randomElement()
//
//// output.map({ $0.1 - $0.0 })
//
//            //output.map({ $0.1 != $0.0 })
//            //table[consecutiveInteger][yCoordinate] != table[consecutiveInteger + 1][yCoordinate + 1] && (brickObjects.filter{$0.yCoordinate == yCoordinate && $0.isOccupied == true }).isEmpty != true
//
//            if ( (output.map({ $0.1 != $0.0 })).isEmpty != true && (brickObjects.filter{$0.yCoordinate == yCoordinate && $0.isOccupied == true }).isEmpty != true){
//
//
////                var changeY = brickObjects.filter{$0.yCoordinate == yCoordinate && $0.isOccupied == true}
////                brickObjects[changeY] = yCoordinate
//
//
//                //let index2 = brickObjects.firstIndex(where: {$0.xCoordinate == value.xCoordinate && value.yCoordinate == 0})
//                //
//                //            if value.isOccupied != true && value.xCoordinate == 0 && value.yCoordinate == 0 {
//                //
//                //                brickObjects[index2!].xCoordinate = randomInt
//
//
//                let changeY = brickObjects.firstIndex(where: {$0.yCoordinate == $0.yCoordinate})
//                brickObjects[changeY!].yCoordinate = yCoordinate
//
//                let changeAvailability = brickObjects.firstIndex(where: {$0.yCoordinate == $0.yCoordinate})
//                brickObjects[changeAvailability!].isOccupied = true
//
//
//
//
//                }
//
//
//
//
//
//            // table[consecutiveInteger + 1][yCoordinate + 1])
//
//            //  }
//        }
//
//    }
//
//
//
//
//
//   // print(brickObjects)
//
//    for object in brickObjects {
//
//        // +1 because it starts from 0
//
//
//        //print(randomInt)
//
//        let value = object
//
//        //firstIndexOfIsOccupied
//
//
////        if object.isOccupied != true &&
////            object.xCoordinate == 0 &&
////            object.yCoordinate == 0 &&
////            brickObjects.firstIndex(where: {index in index.brickValue == object.brickValue}){
////
////
////
////        }
//
//
//
////        var possibleValue:Int {
////
////            if randomInt == ((brickObjects.count + 1)/4){
////                return randomInt - 1
////            } else if randomInt == ((brickObjects.count + 1)/4 + 1){
////                return randomInt + 1
////            } else {
////                return 5
////            }
////        }
//
//       // print(possibleValue)
//
////            let index1 = brickObjects.firstIndex(where: {index in index.xCoordinate == value.xCoordinate})
////            brickObjects[index1!].xCoordinate = randomInt //problem lb
////
////        let index2 = brickObjects.firstIndex(where: {index in index.yCoordinate == value.yCoordinate})
////        brickObjects[index2!].yCoordinate = possibleValue
//
//        //print(index3)
//
//
//    }
//
//
//}
//
//getBrickPieces()
//
//print("\n", brickObjects)
