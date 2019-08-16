//
//  Model.swift
//  TableViewRepeat
//
//  Created by cscoi008 on 2019. 8. 12..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var num: String
    
    init(name: String, num: String) {
        self.name = name
        self.num = num
    }
}

class Model: NSObject {
    var employee: [Person] = []
    
    override init() {
        super.init()
        
        employee.append(Person.init(name: "a", num: "0"))
        employee.append(Person.init(name: "b", num: "1"))
        employee.append(Person.init(name: "c", num: "2"))
        employee.append(Person.init(name: "d", num: "3"))
        employee.append(Person.init(name: "e", num: "4"))
        employee.append(Person.init(name: "f", num: "5"))
        employee.append(Person.init(name: "g", num: "6"))
        
    }
}
