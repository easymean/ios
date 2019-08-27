//
//  ViewController.swift
//  RCPGame
//
//  Created by cscoi008 on 2019. 8. 16..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winProbLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var userRgpLabel: UILabel!
    @IBOutlet var comRgpLabel: UILabel!
    
    var results : [Result] = []
    var user: Int = 0
    var com: Int = 0
    var userWin: Double = 0.0
    var total: Double = 0.0

    
    //파일을 로드합니다.
    func loadConTactsFromFile() {

        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("results.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
            print("jsonData를 불러옴")
        } catch{
            print("load data 실패: " + error.localizedDescription)
            self.initializeView()
            return
        }

        let decoder: JSONDecoder = JSONDecoder()
        do {
            results = try decoder.decode([Result].self, from: jsonData)
            print("파일에서 불러 온 결과 수: \(results.count)")
        } catch {
            print("decode 실패: " + error.localizedDescription)
            return
        }
    }

    
    //results배열을 json파일에 저장합니다.
    func saveContactsToFile() {
        let encoder: JSONEncoder = JSONEncoder()
        let jsonData: Data
        do{
            jsonData = try encoder.encode(results)
        } catch {
            print("encode 실패: " + error.localizedDescription)
            return
        }
        
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("results.json")
        
        do{
            try jsonData.write(to: filePath)
        } catch {
            print("write to path 실패 " + error.localizedDescription)
            return
        }
        print("저장 완료, 현재 저장된 결과 수 : \(results.count)")

    }
    
    //버튼을 누르면 user의 가위바위보가 정해집니다. 0은 가위 1은 바위 2는 보
    @IBAction func PushButton(_ sender: UIButton){
        if sender.tag == 0 {
            user = 0
        } else if sender.tag == 1 {
            user = 1
        } else {
            user = 2
        }
        
        whoWin()
    }

    //label에 이미지를 삽입합니다.
    func showRGP(rgp: Int) -> String {
        if rgp == 0 {
            return "✌️"
        } else if rgp == 1 {
            return "✊"
        } else {
            return "✋"
        }
    }
    
    //가위바위보 결과를 산출합니다.
    func whoWin() {
        com = Int(arc4random_uniform(3))
        
        if (user == 1 && com == 0 ) || (user == 2 && com == 1 ) || (user == 0 && com == 2 ) {
            resultLabel.text = "사용자 승리"
            userWin += 1
        }
        
        if (user == 0 && com == 1 ) || (user == 1 && com == 2 ) || (user == 2 && com == 0 ) {
            resultLabel.text = "컴퓨터 승리"
        }
        
        if user == com {
            resultLabel.text = "비김"
        }
        
        total += 1
        userRgpLabel.text = showRGP(rgp: user)
        comRgpLabel.text = showRGP(rgp: com)
        
        let winProbString = "\(floor((userWin/total) * 1000)/10)"
        winProbLabel.text = "승률: \(winProbString)%"
        
        saveNewResult()
    }

    //results배열에 현재 정보를 저장합니다.
    func saveNewResult() {
        
        let newResult: Result = Result()
        if let resultLabelStrig = resultLabel.text {
            newResult.result = resultLabelStrig
            }
        newResult.createdAt = Date() //현재 날짜가 추가됩니다.
        newResult.winProbability = winProbLabel.text
        results.append(newResult)
        print("results배열에 현재 정보를 저장")
        
        saveContactsToFile()
    }

    func initializeView() {
        userRgpLabel.text = self.showRGP(rgp: user)
        comRgpLabel.text = self.showRGP(rgp: com)
        winProbLabel.text = "승률: 0.0%"
        resultLabel.text = "비김"
        print("뷰 초기화")
    }
    
    //탭 전환 시 매번 실행됩니다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        results.removeAll()
        loadConTactsFromFile()
        print("results배열에 있는 결과 수 : \(results.count)")
        print("view will appear")
    }
    
    //맨 처음 앱을 실행시켰을 때만 실행된다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeView()
        
        print("뷰가 로드되었습니다.")
    }


}

