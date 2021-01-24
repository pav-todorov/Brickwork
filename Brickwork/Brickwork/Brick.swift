//
//  Brick.swift
//  BrickworkPrototype
//
//  Created by Pavel on 22.01.21.
//

import Foundation
struct Brick {
    
    
    var xCoordinate:Int
    var yCoordinate:Int
    
    var isOccupied:Bool
    var brickValue:Int

    init(xCoordinate: Int, yCoordinate:Int, isOccupied:Bool, brickValue:Int) {
        self.xCoordinate = xCoordinate
        self.yCoordinate = yCoordinate
        self.isOccupied = isOccupied
        self.brickValue = brickValue
        
        }    
}
