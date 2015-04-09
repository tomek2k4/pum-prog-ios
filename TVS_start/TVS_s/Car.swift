//
//  Car.swift
//  TVS_s
//
//  Created by Henryk Telega on 03.12.2014.
//  Copyright (c) 2014 IIiMKUJ. All rights reserved.
//

import Foundation
import UIKit

class Car{
    var producer:String
    var model:String
    var carImageFileName: String?
    var carImage: UIImage?
    
    init(producer: String, model: String, carImageFileName: String?, carImage:UIImage?){
        self.producer = producer
        self.model = model
        self.carImageFileName = carImageFileName
        self.carImage = carImage
    }
    
    class func carFromDictionary(carDictionary:NSDictionary)->Car{
        return Car(producer: carDictionary["producer"] as String,model: carDictionary["model"] as String,carImageFileName: carDictionary["imageFileName"] as String?,carImage:
        UIImage(data: carDictionary["image"] as NSData))
    }
    
    func plistEncodedCar()->NSDictionary{
        var carDictionary:NSMutableDictionary = NSMutableDictionary()
        carDictionary["producer"]=self.producer
        carDictionary["model"]=self.model
        if (self.carImageFileName != nil){
            carDictionary["imageFileName"]=self.carImageFileName
        }
        if (self.carImage != nil){
            carDictionary["image"]=UIImageJPEGRepresentation(self.carImage!,1.0)
        }
        return carDictionary
    }
}