//
//  Cities.swift
//  WeatherToday
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class Cities: NSObject, Codable {
    var cityName: String!
    var state: Int!
    var celsius: Double!
    var rainfallProbability: Int!
    
    //state와 imageview를 매칭합니다. 
    func changeToString(state: Int) -> String{
        switch state{
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return ""
        }
    }
  
    //섭씨를 화씨로 바꿔줍니다.
    func changeToFahrenheit(celsius: Double) -> Double {
        var fahrenheit: Double
        fahrenheit = (celsius * 1.8) + 32
        return fahrenheit
    }
}
