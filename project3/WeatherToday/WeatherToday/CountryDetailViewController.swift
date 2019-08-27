//
//  CountryDetailViewController.swift
//  WeatherToday
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//국가를 클릭했을 떄 상세 항목 페이지 입니다.
class CountryDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    var assetName: String!
    var koreanName: String!
    var cities: [Cities] = []
    
    let cityCellIdentifier: String = "CityCustom"

    
    //코드 확인
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.cityTableView.rowHeight = UITableViewAutomaticDimension
        self.cityTableView.estimatedRowHeight = 500
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        self.navigationItem.title = koreanName
        
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        //optional 오류????
        guard let dataName = self.assetName else {
            print("dataName을 불러오지 못했습니다.")
            return
        }
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "\(dataName)") else {
            print("\(self.assetName) data를 가져오지 못했습니다.")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do{
            cities = try decoder.decode([Cities].self, from: jsonData)
        } catch {
            print("json decoding failed: ", error.localizedDescription)
        }
        
        let citiesCount = cities.count
        print("\(citiesCount)개의 도시를 불러왔습니다.")
        
    }
    
    //row 클릭 시 애니메이션 효과를 설정합니다. 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cityTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    //section의 row return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    //cell 정의
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cityCellIdentifier, for: indexPath) as! CityCustomCell
        
        cell.separatorInset = UIEdgeInsets.zero
        cell.rainfallProbabilityLabel.textColor = UIColor.black
        cell.celsiusLabel.textColor = UIColor.black
        cell.tag = indexPath.row
        
        let city: Cities = cities[indexPath.row]
        
        var cityFahrenheit: Double
        
        cell.cityNameLabel.text = city.cityName
        
        let cityImageName = city.changeToString(state: city.state)
        cell.weatherImageView.image = UIImage(named: "\(cityImageName)")
       
        if let cityRainfallProbability:Int = city.rainfallProbability,
            let cityCelsius:Double = city.celsius
        {
            if cityRainfallProbability >= 60 {
                cell.rainfallProbabilityLabel.textColor = UIColor.blue
            }
            if cityCelsius < 10 && indexPath.row != 0 {
                cell.celsiusLabel.textColor = UIColor.orange
            }
            
            cityFahrenheit = floor(city.changeToFahrenheit(celsius: cityCelsius)*10) / 10
            cell.rainfallProbabilityLabel.text = "강수확률 \(cityRainfallProbability)%"
            cell.celsiusLabel.text = "섭씨 \(cityCelsius)도/ 화씨 \(cityFahrenheit)도"
        
        } else {
            print("정보를 불러올 수 없습니다.")
        }
        
        return cell
    }
    
    //segue를 설정합니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell: CityCustomCell = sender as? CityCustomCell else {
            print("cell이 cityCustomCell이 아닙니다.")
            return
        }
        
        guard let nextViewController = segue.destination as? CityDetailViewController else {
            print("nexViewController가 CityDetailViewController가 아닙니다.")
            return
        }

        let tag: Int = cell.tag
        nextViewController.city = cities[tag]
        print("\(tag)가 선택되었습니다.")
        
        let cityName: String = cities[tag].cityName
        print("\(cityName)시가 선택되었습니다.")
        
    }
    
}
