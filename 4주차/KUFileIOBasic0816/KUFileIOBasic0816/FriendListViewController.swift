//
//  FriendListViewController.swift
//  KUFileIOBasic0816
//
//  Created by cscoi008 on 2019. 8. 16..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet var listTableView: UITableView!
    var contactsInfo: [ContactInfo] = []
    let cellIdentifier: String = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as!
            FriendTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date: Date = contactsInfo[indexPath.row].created {
            let dateString: String = dateFormatter.string(from: date)
            cell.dateField?.text = dateString
        }

        cell.nameField?.text = contactsInfo[indexPath.row].name
        cell.mobileField?.text = contactsInfo[indexPath.row].mobile
        
        
        return cell
    }
    
    
}
