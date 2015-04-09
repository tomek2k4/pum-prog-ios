//
//  ViewController.swift
//  Cars1
//
//  Created by IIUJ on 01.03.2015.
//  Copyright (c) 2015 IIUJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var producerTextField: UITextField!
    
    @IBOutlet weak var modelTextField: UITextField!
    
    @IBOutlet weak var numberOfCarsLabel: UILabel!
    
    var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        producerTextField.delegate = self
        modelTextField.delegate = self
    }

    @IBAction func backgroundTouched(sender: UIControl) {
        self.view.endEditing(true)
    }
    
    @IBAction func addCar() {
        
        cars.append(Car(producer: producerTextField.text, model: modelTextField.text))
        
        numberOfCarsLabel.text = String(cars.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

