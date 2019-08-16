//
//  ViewController.swift
//  KUSingletoneSample0808
//
//  Created by cscoi008 on 2019. 8. 8..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    
    //textfield의 값이 바뀔 때마다 아래 함수가 호출됩니다.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        determineButtonState()
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameField.delegate = self
        ageField.delegate = self
        
    }
    
    
    //view가 사라지기 전에 정보를 저장합니다.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        MyInfo.shared.name = nameField.text
        MyInfo.shared.age = ageField.text
        
    }
    
    func determineButtonState(){
        
        if let name: String = nameField.text, name.count>0,
            let age: String = ageField.text, age.count>0 {
            nextButton.isEnabled = true
        }else {
            nextButton.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = MyInfo.shared.name
        ageField.text = MyInfo.shared.age
    }

    

}

