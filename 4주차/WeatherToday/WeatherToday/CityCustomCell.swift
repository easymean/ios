//
//  CityCustomCell.swift
//  WeatherToday
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class CityCustomCell: UITableViewCell {
    
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var rainfallProbabilityLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
