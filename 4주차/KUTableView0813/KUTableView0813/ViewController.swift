//
//  ViewController.swift
//  KUTableView0813
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let defaultCellIdentifier: String = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell 재사용, 컨베이어 벨트를 떠올립니다. 
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.section), \(indexPath.row)"
        
        //재사용 문제 때문에 초기화 하는 것이 필요합니다.
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section % 2 == 0 {
            return 50
        }else {
            return 150
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //선택한 셀의 위치를 표시합니다. 표시한 후 효과를 사라지게 합니다.
        print("\(indexPath.section) Section \(indexPath.row) Row is selected")
        tableView.deselectRow(at: indexPath, animated: true)
        
        //cell을 선언합니다.
        let cell = tableView.cellForRow(at: indexPath)
        
        //짝수 row선택시 핑크색뷰로 홀수 row선택시 파란색 뷰로 넘어갑니다.
        if indexPath.row % 2 == 0 {
            self.performSegue(withIdentifier: "ShowPink", sender: cell)
        } else {
            self.performSegue(withIdentifier: "ShowBlue", sender: cell)
        }
    }
    
    //다음 뷰 컨트롤러에 데이터를 보냅니다. next view controller 생성 전에 실행되는 함수입니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //sender 확인
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            print("sender가 cell이 아닙니다.")
            return
        }
//        guard let cellText: String = cell.textLabel?.text else {
//            return
//        }
        
        if segue.identifier == "ShowPink" {
            //sender의 목적지 확인
            guard let nextViewController = segue.destination as? LabelViewController else {
                print("목적지가 LabelViewController가 아닙니다")
                return
            }
            //        nextViewController.text = cellText
            nextViewController.text = cell.textLabel?.text
        } else {
            guard let nextViewController = segue.destination as? LabelViewController else {
                print("목적지가 LabelViewController가 아닙니다")
                return
            }
            nextViewController.text = ""
        }

    }
}

