//
//  ViewController.swift
//  SignUp
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

// 회원가입에 대한 페이지입니다.
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordCheckField: UITextField!
    @IBOutlet weak var introduceSelfTextView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var goRootButton: UIButton!
    @IBOutlet weak var pushButton: UIButton!
    
    //viewController가 UIImagePickerController를 delegate합니다.
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    //입력된 항목을 저장합니다.
    @IBAction func touchUpSaveInfo(_ sender: UIButton) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = passwordField.text
        UserInformation.shared.introduceSelf = introduceSelfTextView.text
        
        print("id, password, introduce successfully saved")
    }
    
    //자기 소개의 공백여부를 확인하고 버튼을 활성화하는 함수입니다.
    @IBAction func activateButton(){
        
        self.pushButton.isEnabled = false
        
        guard let id: String = self.idField.text, !id.isEmpty,
            let password: String = self.passwordField.text,!password.isEmpty,
            let passwordCheck: String = self.passwordCheckField.text, !passwordCheck.isEmpty,
            let introduceSelf: String = self.introduceSelfTextView.text, !introduceSelf.isEmpty,
            self.imageView.image != nil
            else {
                print("empty field exists")
                return
        }
        
        //비밀번호와 비밀번호 확인 필드의 일치여부를 확인합니다. 일치 시 push버튼을 활성화합니다.
        if password == passwordCheck {
            self.pushButton.isEnabled = true
        }else{
            print("비밀번호가 일치하지 않습니다.")
            return
        }
    }
    
    //정보를 저장하지 않고 index 화면으로 dismiss
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
        UserInformation.shared.deleteInfo()
        
        print("pop to index")
    }
    
    //view를 탭할 시 키보드가 강제 종료되는 함수입니다.
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textViewDidChange(_ textView: UITextView) {
        activateButton()
    }
    
    //imageView를 탭할 시 imagePicker가 present하는 함수입니다.
    @IBAction func tapSelectImageView(_ sender: UITapGestureRecognizer){
        self.present(self.imagePicker, animated:true, completion: nil)
    }
    
   //imgaePicker를 dismiss합니다.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //사진을 편집합니다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage : UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.imageView.image = editedImage
        }
        self.dismiss(animated: true, completion: nil)
        self.activateButton()
    }
    
    //view가 화면에 로드된 후 동작을 지시합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introduceSelfTextView.delegate = self
        
        //view를 탭했을 때 키보드가 화면에서 사라집니다.
        let viewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(viewTapGesture)
        
        //이미지view를 탭하면 imagepicker가 present됩니다.
        let imageTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapSelectImageView(_:)))
        self.imageView.addGestureRecognizer(imageTapGesture)
        
        print("ViewController view did load")
    }

}

