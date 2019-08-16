//
//  SecondViewController.swift
//  SignUp
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//회원가입 상세항목 페이지입니다.
class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    //dataLabel의 형식을 지정합니다.
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "MMMM dd, yyyy"
    
        return formatter
    }()
    
    
    //datepicker의 변경된 값을 datalabel에 표시합니다.
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("date changed")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dataLabel.text = dateString
    }

    
    //view를 탭하면 키보드가 사라집니다.
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    //입력된 아이디와 비밀번호를 저장합니다.
    @IBAction func goRootAndSave() {
        UserInformation.shared.phoneNum = phoneNumField.text
        UserInformation.shared.birth = dataLabel.text
        print("successfully saved")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //현재 화면의 정보를 저장하고 이전화면으로 이동합니다.
    @IBAction func popToPrev(){
        UserInformation.shared.phoneNum = phoneNumField.text
        UserInformation.shared.birth = dataLabel.text
        print("successfully saved")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    //모든 정보를 지우고 처음 화면으로 이동합니다.
    @IBAction func goRoot() {
        self.deleteUserInfoAll()
        self.navigationController?.popToRootViewController(animated: true)
        
        print("go to index")
    }
    
    
    //textfield의 값이 바뀔 때마다 함수가 호출됩니다.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        activateButton()
        return true
    }
    
    //세부항목이 모두 채워지면 버튼을 활성화합니다.
    func activateButton(){
        if let phoneNum: String = phoneNumField.text, phoneNum.count>0,
            let birth: String = dataLabel.text, birth.count>0 {
            signUpButton?.isEnabled = true
        }else {
            print("항목이 채워지지 않았습니다.")
            signUpButton?.isEnabled = false
        }
        
    }
    
    func deleteUserInfoAll(){
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.introduceSelf = nil
        UserInformation.shared.birth = nil
        UserInformation.shared.phoneNum = nil
        
        print("all information deleted")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumField.delegate = self
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        let viewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(viewTapGesture)
        
        print("SecondViewController view did load")
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController view did appear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        activateButton()
        print("view did layout subview")
    }
    
  

}
