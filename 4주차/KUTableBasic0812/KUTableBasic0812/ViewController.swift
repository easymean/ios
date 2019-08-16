//
//  ViewController.swift
//  KUTableBasic0812
//
//  Created by cscoi008 on 2019. 8. 12..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let defaultCellIdentifier = "cell"
    let model: ContactsModel = ContactsModel.init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //특정 section에 해당하는 섹션 제목 string을 return
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section % 2 == 0{
            return "Section \(section)"
        }else {
            return nil
        }
    }
    
    //tableView의 section수를 return
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    //특정  section에 해당하는 row의 수를 return; 필수 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section % 2 == 0 {
//            return 3
//        }else {
//            return 7
//        }
        
        return model.friends.count
    }
    
    //특정 indexPath(section, row)에 해당하는 cell return; 필수 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        
//        cell.textLabel?.text = "\(indexPath.section) Section"
//        cell.detailTextLabel?.text = "\(indexPath.row) Row"
        
        let friend: Person = model.friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.mobile
        
        return cell
    }
    
    //테이블 높이를 설정하는 함수
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section % 2 == 0 {
            return 50
        }else {
            return 150
        }
    }
    
    //선택한 셀의 위치를 표시합니다. 표시한 후 효과를 사라지게 합니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section) Section \(indexPath.row) Row is selected")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

