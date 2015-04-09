//
//  CarDetailViewController.swift
//  TVS_s
//
//  Created by Henryk Telega on 03.12.2014.
//  Copyright (c) 2014 IIiMKUJ. All rights reserved.
//

import UIKit

class CarDetailViewController: UIViewController {

    var car: Car!
    
    @IBOutlet weak var producerLabel: UILabel!
    
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var carImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        producerLabel.text = car.producer
        modelLabel.text = car.model
        carImageView.image = car.carImage
        
    }
    
}
