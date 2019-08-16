//
//  ViewController.swift
//  KUTFriendsTable0814
//
//  Created by cscoi008 on 2019. 8. 14..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            print("dataAsset 불러오기를 실패했습니다.")
            return
        }
        
        let jsonData: Data = dataAsset.data
        
        do {
           friends = try decoder.decode([Friend].self, from: jsonData)
        } catch {
            print("json decoding failed: ", error.localizedDescription)
        }
        
        let friendsCount: Int = friends.count
        print("\(friendsCount)명의 친구를 불러왔습니다.")
        
        tableView.reloadData()
        
    }
    
    //section당 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    //cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! FriendTableViewCell
        
        let friend: Friend = friends[indexPath.row]
        
        //label의 text는 string?형(optional)
        cell.nameLabel.text = friend.name
        cell.mobileLabel.text = friend.mobile
        if let age = friend.age {
            cell.ageLabel.text = "\(age)"
        }
  
        return cell
    }
    
    //왼쪽으로 스와이프해서 지우는 함수
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //delete가 호출됐을 시 동작하는 함수
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            friends.remove(at: indexPath.row)
            tableView.reloadSections(IndexSet(indexPath.section...indexPath.section), with: UITableViewRowAnimation.automatic)
        }
    }
   
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let cell = sender as? UITableViewCell else {
//            print("sender가 uitablecell형태가 아닙니다.")
//            return
//        }
//
//        guard let nextViewController = segue.destination as? FriendDetailViewController else {
//            print("segue의 목적지가 friendDetail뷰컨트롤러가 아닙니다.")
//            return
//        }
//
//        if let friendName: String = cell.textLabel!.text {
//            nextViewController.friendName = friendName
//        }else {
//            print("friendName이 존재하지 않습니다.")
//            return
//        }
//    }
}

