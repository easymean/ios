//
//  ResultsViewController.swift
//  RCPGame
//
//  Created by cscoi008 on 2019. 8. 19..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var resultTableView: UITableView!
    let cellIdentifier: String = "cell"
    var results: [Result] = []
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        return formatter
    }()
    
    //파일을 로드합니다.
    func loadConTactsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("results.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
            print("jsonData를 불러옴")
        } catch{
            print("load data 실패: " + error.localizedDescription)

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
    
    //모든 정보를 초기화합니다.
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("results.json")

        do {
            try FileManager.default.removeItem(at: filePath)
            results.removeAll()
        } catch {
            print("reset 실패: " + error.localizedDescription)
        }
        self.initializeSecondView()
        resultTableView.reloadData()
        print("파일에 저장된 결과 수 : \(results.count)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = resultTableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! ResultTableViewCell
        
        let selectedResult = results[indexPath.row]

        cell.resultTableLabel.text = selectedResult.result
        
        if let date = selectedResult.createdAt {
            let dateString: String = self.dateFormatter.string(from: date)
            cell.dateTabelLabel.text = dateString
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func initializeSecondView() {
        
        if results.count == 0 {
             self.navigationItem.title = "승률: 0.0%"
        } else {
            if let winProbString = results[results.count - 1].winProbability {
                self.navigationItem.title = winProbString
            }
        }
        print("result뷰가 초기화")
    }
    
    //매번 로드됩니다. 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadConTactsFromFile()
        resultTableView.reloadData()
        print("resultview will appear")
    }
    
    //맨 처음 한번만 로드됩니다.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        resultTableView.delegate = self
        resultTableView.dataSource = self

        loadConTactsFromFile()
        initializeSecondView()
        print("result뷰가 로드됨")
    }


}
