//
//  CountryTableViewController.swift
//  TomaszCountries
//
//  Created by Podyplomowe on 28.03.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    var countries = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append( Country(name:"Australia",population:230000000,capitalCity:City(name:"Canberra",population:40000),flag:UIImage(named: "australia-flag")))
        countries.append( Country(name:"Germany",population:660000000,capitalCity:City(name:"Berlin",population:5000000),flag:UIImage(named: "germany-flag")))
//        countries.append("Niemcy")
//        countries.append("Czechy")
//        countries.append("Slowacja")
//        countries.append("Ukraina")
//        countries.append("Bialorus")
//        countries.append("Litwa")
//        countries.append("Rosja")
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = tableView.indexPathForSelectedRow()
        
        let dvc = segue.destinationViewController as CountryDetailViewController
        dvc.country = countries[selectedRow!.row]
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return countries.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CountryCell", forIndexPath: indexPath) as CountryTableViewCell

        // Configure the cell...
        
        cell.countryLabel.text = countries[indexPath.row].name
        cell.capitalCity.text = countries[indexPath.row].capitalCity.name
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

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

}
