//
//  SecondViewController.swift
//  SignUp
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//회원가입 상세항목 페이지입니다.
class SecondViewController: UIViewController{

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
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dataLabel.text = dateString
        
        print("date changed")
        self.changeButtonState()
    }

    //view를 탭하면 키보드가 사라집니다.
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //입력된 아이디와 비밀번호를 저장하고 index로 돌아갑니다.
    @IBAction func goToIndexAndSave() {
        UserInformation.shared.phoneNum = phoneNumField.text
        UserInformation.shared.birth = dataLabel.text
        
        self.dismiss(animated: true, completion: nil)
        print("successfully saved")
    }
    
    //현재 화면의 정보를 저장하고 이전화면으로 이동합니다.
    @IBAction func popToPrev(){
        UserInformation.shared.phoneNum = phoneNumField.text
        UserInformation.shared.birth = dataLabel.text
        self.navigationController?.popViewController(animated: true)
        print("successfully saved")
    }
    
    //모든 정보를 지우고 처음 화면으로 dismiss
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
        UserInformation.shared.deleteInfo()
        print("dismiss to index")
    }
    
    //textfield에 연결된  ibaction입니다.
    @IBAction func activateButton(_ sender: UIButton) {
        self.changeButtonState()
    }
    
    //세부항목이 모두 채워지면 버튼을 활성화합니다.
    func changeButtonState() {
        self.signUpButton.isEnabled = false
        
        if let phoneNum: String = phoneNumField.text, phoneNum.count>0
            ,let birth: String = dataLabel.text, birth.count>0
        {
            signUpButton.isEnabled = true
        }else {
            print("항목이 채워지지 않았습니다.")
            signUpButton.isEnabled = false
        }
    }

    //뷰가 로드됩니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        let viewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        self.view.addGestureRecognizer(viewTapGesture)
        
        print("SecondViewController view did load")
    }

}
