//
//  ViewController.swift
//  KUFileIOBasic0816
//
//  Created by cscoi008 on 2019. 8. 16..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit
//swift정보를 인코딩 합니다.
class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var mobileField: UITextField!
    var contacts: [ContactInfo] = []
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        let newContact: ContactInfo = ContactInfo()
        newContact.name  = nameField.text
        newContact.mobile = mobileField.text
        newContact.created = Date() //현재 날짜가 추가됩니다.
        contacts.append(newContact)
        saveContactsToFile()
    }
    
    func saveContactsToFile() {
        let encoder: JSONEncoder = JSONEncoder()
        let jsonData: Data
        do{
            jsonData = try encoder.encode(contacts)
        } catch {
            print("encode 실패: " + error.localizedDescription)
            return
        }
        
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("contacts.json")
        
        do{
            try jsonData.write(to: filePath)
        } catch {
            print("write to path 실패 " + error.localizedDescription)
            return
        }
        print("저장 완료, 현재 저장된 연락처 수 : \(contacts.count)")
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("contacts.json")
        
        do {
            try FileManager.default.removeItem(at: filePath)
            contacts.removeAll()
        } catch {
            print("reset 실패: " + error.localizedDescription)
        }
    }
    
    func loadConTactsFromFile() {
        let filePath = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("contacts.json")
        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: filePath)
            print("jsonData를 불러옴")
        } catch{
            print("load data 실패: " + error.localizedDescription)
            return
        }
        
        let decoder: JSONDecoder = JSONDecoder()
        do {
            contacts = try decoder.decode([ContactInfo].self, from: jsonData)
            print("파일에서 불러 온 친구 수: \(contacts.count)")
        } catch {
            print("decode 실패: " + error.localizedDescription)
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        loadConTactsFromFile()
        guard let button = sender as? UIButton else {
            print("sender가 버튼이 아닙니다.")
            return
        }
        print("sender가 버튼입니다.")
        
        guard let nextViewController = segue.destination as? FriendListViewController else {
            print("sender의 목적지가 friendListViewController가 아닙니다.")
            return
        }
        print("sender의 목적지가 friendlist입니다."
        )
        nextViewController.contactsInfo = contacts
        print("정보가 \(nextViewController.contactsInfo.count)개 전달되었습니다.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}

