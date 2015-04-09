//
//  Countries.swift
//  TomaszCountries
//
//  Created by Podyplomowe on 29.03.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

import Foundation
import UIKit

class City{
    let name:String
    var population: Int
    
    //designated initializer
    init (name: String, population:Int){
        self.name = name
        self.population = population
    }
    
    //convenience initializer
    convenience init(name:String){
        self.init(name:name,population:0)
    }
    
}

class Country{
    
    var name: String
    var population:Int
    var capitalCity:City
    var flag: UIImage?
    
    init(name:String, population:Int, capitalCity:City,flag:UIImage?){
        self.name = name
        self.population = population
        self.capitalCity = capitalCity
        self.flag = flag
    }
    
    init(name:String, population:Int, capitalCity:City){
        self.name = name
        self.population = population
        self.capitalCity = capitalCity
    }
    
    
}