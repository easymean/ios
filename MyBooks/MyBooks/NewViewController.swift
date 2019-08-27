//
//  NewViewController.swift
//  MyBooks
//
//  Created by cscoi008 on 2019. 8. 22..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    var bookName: String?
    var bookAuthor: String?
    var bookPublisher: String?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var publisherLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = bookName
        authorLabel.text = bookAuthor
        publisherLabel.text = bookPublisher
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
