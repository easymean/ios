//
//  ViewController.swift
//  TableView
//
//  Created by cscoi008 on 2019. 8. 8..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
    let cellIdentifier: String = "cell"
    let customIdentifier: String = "CustomCellIdentifier"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바"]
    
    let english: [String] = ["a", "b", "c", "d", "e", "f"]
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func touchUpButton(_ sender: UIButton){
        //dates 배열에 날짜 데이터를 추가합니다.
        dates.append(Date())
        
        
//        self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableViewRowAnimation.automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
                cell.textLabel?.text = text
            return cell
            
        } else {
            let cell: CustomTableCell = tableView.dequeueReusableCell(withIdentifier: self.customIdentifier, for: indexPath) as! CustomTableCell
            
            //dates 배열에 있는 같은 위치의 데이터를 cell에 집어 넣기! dateformatter.string이라는 것 기억하기~~~
            cell.leftLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel?.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
        }
    
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "korean" : "english"
        } else {
            return nil
        }
    }

}

