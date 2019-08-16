//
//  ViewController.swift
//  Mamamoo
//
//  Created by cscoi008 on 2019. 8. 9..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    var mamamoo: Mamamoo!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //디코더를 선언합니다.
        let decoder: JSONDecoder = JSONDecoder()
        //카멜케이스로 바꿔줍니다.
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        //데이터를 가져오지 못한 경우 오류를 설정합니다.
        guard let dataAsset: NSDataAsset = NSDataAsset(name:"mamamoo_json") else {
            print("data asset을 가져올 수 없습니다.")
            return
        }
        
        //데이터 변수를 설정합니다.
        let jsonData: Data = dataAsset.data
        
        //json데이터에서 디코더를 사용하여 정보를 가져옵니다.
        do{
            mamamoo = try decoder.decode(Mamamoo.self, from: jsonData)
        } catch {
            print("json decoding failed: ", error.localizedDescription)
        }
        
        //네비게이션 타이틀을 설정합니다.
        self.navigationItem.title = mamamoo.name
        
        self.titleLabel.text = mamamoo.titles
        
        let memberCount = mamamoo.members.count
        print("\(memberCount)명의 멤버를 불러왔습니다.")
    }

    //버튼을 선택했을 떄 다음 화면으로 연결고리를 설정합니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let button: UIButton = sender as? UIButton else {
            print("sender가 버튼이 아닙니다")
            return
        }
        
        let tag: Int = button.tag
        
        guard let nextViewController = segue.destination as? MamamooViewController else {
            print("목적지가 MamamooViewController가 아닙니다.")
            return
        }
        
        nextViewController.member = mamamoo.members[tag]
        
        for i in [0,1,2,3]{
            if tag == i {
                print("\(i)번 버튼이 선택되었습니다.")
            }
        }
        
    }
    
}

