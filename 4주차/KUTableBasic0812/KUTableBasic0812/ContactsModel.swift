//
//  ContactsModel.swift
//  KUTableBasic0812
//
//  Created by cscoi008 on 2019. 8. 12..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var mobile: String
    
    init(name: String, mobile: String) {
        self.name = name
        self.mobile = mobile
    }
}

class ContactsModel: NSObject {
    var friends: [Person] = []
    
    override init() {
        super.init()
        
        friends.append(Person.init(name: "가", mobile: "0123456"))
        friends.append(Person.init(name: "나", mobile: "0123457"))
        friends.append(Person.init(name: "다", mobile: "1231321"))
        friends.append(Person.init(name: "라", mobile: "323232323"))
        friends.append(Person.init(name: "마", mobile: "1234789"))
        friends.append(Person.init(name: "바", mobile: "1878978"))
        friends.append(Person.init(name: "사", mobile: "939393"))
        friends.append(Person.init(name: "아", mobile: "293489230"))
        friends.append(Person.init(name: "자", mobile: "38383838"))
        friends.append(Person.init(name: "차", mobile: "27272727"))
        friends.append(Person.init(name: "카", mobile: "676767"))
        friends.append(Person.init(name: "타", mobile: "898989"))
        friends.append(Person.init(name: "파", mobile: "252525"))
        friends.append(Person.init(name: "하", mobile: "101010"))
        friends.append(Person.init(name: "다했다", mobile: "7899000"))
        
        
        
    }
}
