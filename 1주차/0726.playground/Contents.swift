//: Playground - noun: a place where people can play

import UIKit

//Bear class
class Bear{
    
    //기능
    
    func introduceMySelf(){
        print("제 이름은")
    }
    
    func bark(){
        print("어흥")
    }
    
    func houseKeeping(){
        print("곰은 사람을 찢어요")
    }
    
    //Bear 공장
    init(){
        
    }
}

let a = Bear.init()
a.bark() //함수 실행
a.houseKeeping()

let b = Bear.init()
b.bark()
b.houseKeeping()


//Cat class
class Cat{
    
    func introduceMySelf(){
        print("제 이름은")
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
let ca = Cat.init()
let ba = Cat.init()

