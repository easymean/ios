//
//  FriendDetailViewController.swift
//  KUTFriendsTable0814
//
//  Created by cscoi008 on 2019. 8. 14..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    var friendName: String!
    
    @IBOutlet var phoneNum: UILabel!
    @IBOutlet var age: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNum.text = friendName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
