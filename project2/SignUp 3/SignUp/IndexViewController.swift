//
//  IndexViewController.swift
//  SignUp
//
//  Created by cscoi008 on 2019. 8. 7..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//index화면에 대한 뷰 컨트롤러 입니다.
class IndexViewController: UIViewController {
    
    @IBOutlet weak var idField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idField.text = UserInformation.shared.id
        print("view will appear")
    }

}
