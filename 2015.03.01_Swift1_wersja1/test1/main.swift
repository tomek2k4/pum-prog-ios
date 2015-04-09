//
//  main.swift
//  test1
//
//  Created by IIUJ on 01.03.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

import Foundation

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms:Int?
    init(numberOfRooms: Int ){
        self.numberOfRooms = numberOfRooms
    }
}

let john = Person()
john.residence = Residence(numberOfRooms:3)

if let residenceNotOptional = john.residence {
    println("Number of rooms = \(john.residence!.numberOfRooms!)")
    println("Number of rooms = \(residenceNotOptional.numberOfRooms!)")
}else{
    println("There is no residence")
}


