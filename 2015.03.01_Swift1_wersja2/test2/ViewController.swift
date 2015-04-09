//
//  ViewController.swift
//  test2
//
//  Created by IIUJ on 01.03.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let john = Person()
    let roomCount = john.residence?.numberOfRooms
    let x = 5
    println(x)
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

