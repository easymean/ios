//
//  CityDetailViewController.swift
//  WeatherToday
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet var detailWeatherImageView: UIImageView!
    @IBOutlet var detailWeatherLabel: UILabel!
    @IBOutlet var detailCelsiusLabel: UILabel!
    @IBOutlet var detailRainfallLabel: UILabel!
    
    var city: Cities!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = city.cityName
        
        var fahren: Double
        
        if let celsius: Double = city.celsius,
            let rainfall: Int = city.rainfallProbability {
            
            if celsius < 10 {
                self.detailCelsiusLabel.textColor = UIColor.orange
            }
            
            if rainfall >= 60 {
                self.detailRainfallLabel.textColor = UIColor.blue
            }
            fahren = floor(city.changeToFahrenheit(celsius: celsius)*10) / 10
            self.detailCelsiusLabel.text = "섭씨 \(celsius)도 / 화씨 \(fahren)도"
            self.detailRainfallLabel.text = "강수확률 \(rainfall)%"
        }
        
        let detailWeatherImageName: String = city.changeToString(state: city.state)
        self.detailWeatherImageView.image = UIImage(named: detailWeatherImageName)
        
        let cityState: Int = city.state
        
        switch cityState {
        case 10:
            self.detailWeatherLabel.text = "맑음"
        case 11:
            self.detailWeatherLabel.text = "구름 많음"
        case 12:
            self.detailWeatherLabel.text = "비"
        case 13:
            self.detailWeatherLabel.text = "눈"
        default:
            self.detailWeatherLabel.text = nil
        }
        
    }

}
