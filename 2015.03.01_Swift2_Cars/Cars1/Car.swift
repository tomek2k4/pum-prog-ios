//
//  Car.swift
//  Cars1
//
//  Created by IIUJ on 01.03.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

import Foundation
import UIKit

class Car {
    let producer:String
    let model:String?
    let image:UIImage?
    init(producer:String){
        self.producer = producer
    }
    init(producer:String,model:String){
        self.producer = producer
        self.model = model
    }
}
