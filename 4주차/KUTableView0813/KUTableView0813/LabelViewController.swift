//
//  LabelViewController.swift
//  KUTableView0813
//
//  Created by cscoi008 on 2019. 8. 13..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text

        // Do any additional setup after loading the view.
    }
    

}
