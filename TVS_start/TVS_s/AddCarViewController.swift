//
//  AddCarViewController.swift
//  TVS_s
//
//  Created by Henryk Telega on 14.01.2015.
//  Copyright (c) 2015 IIiMKUJ. All rights reserved.
//

import UIKit
import MobileCoreServices

class AddCarViewController: UIViewController, UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var producer: UITextField!
    
    @IBOutlet weak var model: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var takeAPhotoOrChooseImageButton: UIBarButtonItem!
    
    var delegate:AddCarViewControllerDelegate!
    
    lazy var car: Car = Car(producer: "",model: "",carImageFileName: nil,carImage: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.producer.delegate = self
        self.model.delegate = self
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            takeAPhotoOrChooseImageButton.title = "Take a photo"
        }else{
            takeAPhotoOrChooseImageButton.title = "Choose image"
        }
    }
    
    //Od iOS 8.0 jest nowy sposób prezetacji Alertów (zamiast UIAlertView)
    func showErrorAlert(messageText:String)
    {
        var alert = UIAlertController(title: "Error",
            message: messageText,
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK",
            style: .Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(sender: UIBarButtonItem) {
        if (producer.text==""){
            showErrorAlert("Producer cannot be emty!")
        }
        else if (model.text==""){
            showErrorAlert("Model cannot be emty!")
        }
        else if (imageView.image==nil){
            showErrorAlert("Image cannot be emty!")
        }
        else {
            car.producer = producer.text
            car.model = model.text
            car.carImage = imageView.image
            self.delegate.savePressedInAddCar(car)
            super.dismissViewControllerAnimated(true,completion:nil)
        }
    }
    
    // MARK: - Image Picker
    
    @IBAction func chooseImage(sender: UIBarButtonItem) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerController.mediaTypes = [kUTTypeImage]
            imagePickerController.editing = false
        }else{
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let selectedImage: UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        imageView.image = selectedImage
        self.car.carImage = selectedImage
        super.dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        super.dismissViewControllerAnimated(true,completion:nil)
    }

    /* Ewentualnie można też dodać to:
    // MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        if (textField==producer){
            car.producer = textField.text
        }
        else {
            car.model = textField.text
        }
    }
    */
    
    // MARK: - Hide keyboard
    //Ukrycie klawiatury po przyciśnięciu klawisza Return (Enter)
    //Wykorzystany jest mechanizm delegata pola tekstowego
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        [textField .resignFirstResponder()]
        return true
    }
    
    //Ukrycie klawiatury po tapnięciu w tło. Główny widok nie jest
    //klasu UIView, tylko IUControl, wykorzystany jest wzorzec 
    //"target - action".
    @IBAction func backgroundTouched(sender: UIControl) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - AddCarViewControllerDelegate

protocol AddCarViewControllerDelegate{
    func savePressedInAddCar(car: Car)
}
