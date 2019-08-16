//
//  UserInformation.swift
//  SignUp
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation


class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?

    var introduceSelf: String?
    
    var phoneNum: String?
    var birth: String?
    
    func deleteInfo() {
        self.id = nil
        self.password = nil
        self.introduceSelf = nil
        self.birth = nil
        self.phoneNum = nil
        
        print("UserInfo deleted")
    }
}
