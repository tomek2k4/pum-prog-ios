//
//  CountryTableViewCell.swift
//  TomaszCountries
//
//  Created by Podyplomowe on 28.03.2015.
//  Copyright (c) 2015 Podyplomowe. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var countryLabel: UILabel!
    
    
    @IBOutlet var capitalCity: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
