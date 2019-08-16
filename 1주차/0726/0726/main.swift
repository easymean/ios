//
//  main.swift
//  0726
//
//  Created by cscoi008 on 2019. 7. 26..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation

//Bear class
class Bear{
    
    var name: String
    //기능
    func introduceMySelf(){
        print("저는 곰 \(name)입니다")
    }
    
    func bark(){
        print("어흥")
    }
    
    func houseKeeping(){
        print("곰은 사람을 찢어요")
    }
    
    //Bear 공장
    init(name: String){
        self.name = name
    }
}

let a = Bear.init(name:"a")
a.introduceMySelf()
a.bark()
a.houseKeeping()

//Cat class
class Cat{
    
    var age:Int = 10
    var name:String = "야옹이"
    
    func introduceMySelf(){
        print("저는 \(name)이고 \(age)살입니다. ")
    }
    
    func bark(){
        print("야옹")
    }
    
    func grooming(){
        print("고양이는 귀엽다")
    }
    
    init(){
        
        
    }
}
let ca:Cat = Cat.init()
ca.bark()
ca.name = "짜장이"
ca.age = 8
ca.introduceMySelf()


class Person{
    
    var name:String = "홍길동"
    var age:Int = 20
    var major:String = "Korean language"
    var grade:Int = 1
    
    func sayHello(){
        print("Hello")
    }
    
    func introMySelf(){
        print("My name is \(name).")
    }
    
    func sayAge(){
        print("I am \(age) years old.")
    }
    
    
    func studentInfo(){
        print("major: \(major)")
        print("grade: \(grade)")
    }
    
    func all(){
        sayHello()
        introMySelf()
        sayAge()
        studentInfo()
    }
    
    init(name:String){
        self.name = name
    }
}

let h1:Person = Person.init(name:"dlwlals")
h1.age = 25
h1.grade = 4

h1.sayHello()
h1.introMySelf()
h1.sayAge()
h1.studentInfo()


let h2:Person = Person.init(name:"박보검")
h2.all()

