//
//  CarTableViewController.swift
//  TVS_s
//
//  Created by Henryk Telega on 26.11.2014.
//  Copyright (c) 2014 IIiMKUJ. All rights reserved.
//

import UIKit
import Foundation

class CarTableViewController: UITableViewController,UITableViewDelegate,AddCarViewControllerDelegate{
    
    var cars: [Car] = [Car]();
    let dataFileName = "cars.data"
    
    func saveCars(){
        var carsPlist:NSMutableArray=NSMutableArray()

        for car in self.cars{
            carsPlist.addObject(car.plistEncodedCar())
        }
        let fileManager = NSFileManager.defaultManager()
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
        let documentsDirectory:String = paths[0]
        let fullPath = documentsDirectory.stringByAppendingPathComponent(dataFileName)
        carsPlist.writeToFile(fullPath, atomically: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = NSFileManager.defaultManager()
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
        let documentsDirectory:String = paths[0]
        let fullPath = documentsDirectory.stringByAppendingPathComponent(dataFileName)
        
        if (!fileManager.fileExistsAtPath(fullPath)){
            var imageName = "chevy_volt.jpg"
            var carImage = UIImage(named: imageName)
            var car = Car(producer: "Chevy",model: "Volt",carImageFileName: imageName,carImage: carImage)
            // Funkcja saveImage potrzebna była w innych wersjach programu
            //saveImage(carImage!, withName: imageName)
            cars.append(car)
            
            imageName = "mini_clubman.jpg"
            carImage = UIImage(named: imageName)
            car = Car(producer: "BMW",model: "Mini",carImageFileName: imageName,carImage: carImage)
           // saveImage(carImage!, withName: imageName)
            cars.append(car)
            
            imageName = "toyota_venza.jpg"
            carImage = UIImage(named: imageName)
            car = Car(producer: "Toyota",model: "Venza",carImageFileName: imageName,carImage: carImage)
           // saveImage(carImage!, withName: imageName)
            cars.append(car)

            imageName = "volvo_s60.jpg"
            carImage = UIImage(named: imageName)
            car = Car(producer: "Volvo",model: "S60",carImageFileName: imageName,carImage: carImage)
            //saveImage(carImage!, withName: imageName)
            cars.append(car)

            imageName = "smart_fortwo.jpg"
            carImage = UIImage(named: imageName)
            car = Car(producer: "Smart",model: "Fortwo",carImageFileName: imageName,carImage: carImage)
            //saveImage(carImage!, withName: imageName)
            cars.append(car)
            
            saveCars()

        }
        else{
            var carsPlist: NSArray = NSArray(contentsOfFile: fullPath)!
            
            for carDict in carsPlist {
                self.cars.append(Car.carFromDictionary(carDict as NSDictionary))
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addCar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowCarDetails"{
            var dVC = segue.destinationViewController as CarDetailViewController
            var myIndexPath = self.tableView.indexPathForSelectedRow()
            if let indexPath = myIndexPath {
                dVC.car = cars[indexPath.row]
            }
        }
    }

    func addCar(){
        var vc: AddCarViewController  = self.storyboard?.instantiateViewControllerWithIdentifier("addCarId") as AddCarViewController
    vc.delegate = self
    vc.modalTransitionStyle =  UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)

    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return cars.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> CarTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CarTableCell", forIndexPath: indexPath) as CarTableViewCell

        // Configure the cell...
        cell.carImageView.image=cars[indexPath.row].carImage
        cell.carModelLabel.text=cars[indexPath.row].model
        cell.carProducerLabel.text = cars[indexPath.row].producer
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            let row = indexPath.row
            self.cars.removeAtIndex(row)
            saveCars()

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

        let aux = self.cars[fromIndexPath.row]
        
        self.cars.removeAtIndex(fromIndexPath.row)
        self.cars.insert(aux, atIndex: toIndexPath.row)
        saveCars()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - AddCarViewControllerDelegate
    
    
    func savePressedInAddCar(car: Car){
        self.cars.insert(car, atIndex: 0)
        self.tableView.reloadData()
        saveCars()
    }
    
    
    // Funkcja saveImage potrzebna była w innych wersjach programu
    func saveImage(image:UIImage, withName imageName:String){
        let fileManager = NSFileManager.defaultManager()
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
        let documentsDirectory:String = paths[0]
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        let fullPath = documentsDirectory.stringByAppendingPathComponent(imageName)
        if(!fileManager.createFileAtPath(fullPath, contents: imageData, attributes: nil)){
            println("Image NOT saved")
        }
    }
}
