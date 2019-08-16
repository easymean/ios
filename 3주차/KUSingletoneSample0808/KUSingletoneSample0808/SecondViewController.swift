//
//  SecondViewController.swift
//  KUSingletoneSample0808
//
//  Created by cscoi008 on 2019. 8. 8..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    
    @IBAction func textFieldTextEdited(_ sender: UITextField){
        if let text = sender.text{
            print(text)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //view가 나타나기 전에 textfield에 정보를 세팅합니다. 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = MyInfo.shared.name
        ageField.text = MyInfo.shared.age
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        MyInfo.shared.name = nameField.text
        MyInfo.shared.age = ageField.text
    }

}
