//
//  ViewController.swift
//  SearchMovie
//
//  Created by cscoi008 on 2019. 8. 21..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var queryField: UITextField!
    
    let cellIdentifier = "movieCell"
    var movies: [Movie] = []
    
    @IBAction func touchUpSearchButton(_ sender: UIButton){
        
        guard let query: String = queryField.text, query.isEmpty == false else {
            print("검색어를 입력해주세요")
            return
        }
        
        queryField.endEditing(true)
        search(query)
    }
    
    func search(_ query: String) {
        print("\(query)를 검색합니다. ")
        
        let clientID = "arGTM1BBa7eC5OUWrgOm"
        let cliendSecret = "QaaKCZCDBQ"
        
        let headers: [String:String] = ["X-Naver-Client-Id":clientID, "X-Naver-Client-Secret":cliendSecret]
        
        let urlString = "https://openapi.naver.com/v1/search/movie.json"
        
        let parameters: [String:Any] = ["query":query, "display":50]
        
        let request = Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
        
        request.response {(dataResponse) in
            print(dataResponse.error)
            
            guard let data: Data = dataResponse.data else {
                print("no data")
                return
            }
            
            guard let image: UIImage = UIImage(data: data) else {
                print("이미지 변환 실패")
                return
            }
            
            let decoder: JSONDecoder = JSONDecoder()
            
            do {
                let response: MovieResponse
                response = try decoder.decode(MovieResponse.self, from: data)
                
                if let items: [Movie] = response.items {
                    self.movies = items
                    print("\(items.count)개의 영화가 검색")
                    }
            } catch {
                print(error.localizedDescription)
            }
            self.tableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.pubDate
        
        return cell
    }

}

