//
//  ViewController.swift
//  WeatherToday
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//이름 변경 : CountriesTableViewController
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var countryTableView: UITableView!
    
    var countries: [Countries] = []
    
    let countryCellIdentifier: String = "CountryCustom"
    
    
    //코드 확인
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.countryTableView.rowHeight = UITableViewAutomaticDimension
        self.countryTableView.estimatedRowHeight = 500
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            print("data asset을 가져올 수 없습니다")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do{
            countries = try decoder.decode([Countries].self, from: jsonData)
        } catch {
            print("json decoding failed: ", error.localizedDescription)
        }
        
        self.navigationItem.title = "세계 날씨"
        
        let countryCount = countries.count
        print("\(countryCount)개의 국가를 불러왔습니다.")
    }
    
    //row 클릭 시 애니메이션 효과를 설정합니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.countryTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    //한 section당 row의 수를 return. 여기선 countries 배열의 count를 return합니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    //cell을 생성합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.countryCellIdentifier, for: indexPath)
        
        let country: Countries = countries[indexPath.row]
        
        if let flagName: String = country.assetName {
            cell.imageView?.image = UIImage(named: "flag_" + flagName)
        }
        
        cell.textLabel?.text = country.koreanName
        cell.tag = indexPath.row
        
        return cell
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell else {
            print("cell이 선택되지 않았습니다.")
            return
        }
        
        guard let nextViewController = segue.destination as? CountryDetailViewController else {
            print("목적지가 CountryDetailViewController가 아닙니다." )
            return
        }
        
        let tag: Int = cell.tag
        
        switch tag {
        case 0:
            nextViewController.assetName = "kr"
        case 1:
            nextViewController.assetName = "de"
        case 2:
            nextViewController.assetName = "it"
        case 3:
            nextViewController.assetName = "us"
        case 4:
            nextViewController.assetName = "fr"
        case 5:
            nextViewController.assetName = "jp"
        default:
            print("assetName이 전달되지 않았습니다.")
        }
        
        nextViewController.koreanName = cell.textLabel?.text
    }

}

