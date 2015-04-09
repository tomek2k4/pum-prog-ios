//
//  CountryDetailViewController.swift
//  TomaszCountries
//
//  Created by Podyplomowe on 29.03.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        countryNameLabel.text = country?.name
        
        capitalCityNameLabel.text = country?.capitalCity.name
        var pop:Int = country!.population
        countryPopulationLabel.text = String(pop)
        
        flagImageView.image = country!.flag

    }

    @IBOutlet var countryNameLabel: UILabel!
    
    
    
    @IBOutlet var capitalCityNameLabel: UILabel!
    
    
    
    @IBOutlet var countryPopulationLabel: UILabel!
    
    
    @IBOutlet var flagImageView: UIImageView!
    
    
    var country:Country?
    
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
