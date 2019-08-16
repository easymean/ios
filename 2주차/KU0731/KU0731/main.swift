// 0731 class parameter
//  main.swift
//  KU0731
//
//  Created by cscoi008 on 2019. 7. 31..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation

//enumeration 열거
//선택지를 제공합니다.
enum Color{
    case purple
    case green
    case yellow
}

enum Language{
    case korean
    case english
    case spanish
    case russian
}

enum City{
    case seoul
    case incheon
    case busan
    case goyang
}

enum Yasik{
    case pizza
    case chicken
    case pasta
    case ramen
}

enum Direction{
    case left, right
}

//Hero class 만들기
//Hero 클래스의 객체는
//name 속성을 갖는다
//moveForward 함수로 앞으로 이동한다
//destroy 함수로 무언가를 부순다.
class Hero{
    
    
    var name: String = "Alex"
    //enum에서 정해진 색만 가능합니다.
    var hairColor: Color = Color.yellow
    var eyeColor: Color = Color.purple
    var motherLanguage: Language = Language.russian
    var city: City = City.seoul
    var favorite: Yasik = Yasik.pasta
    
    
    
    //매개변수를 전달합니다.(매개변수이름: 자료형)
    //앞으로 갈 횟수인 steps를 전달합니다.
    func moveForward(steps: Int){
        
        for _ in 1...steps{
            print("앞으로 이동합니다.")
        }
        print("총 \(steps)만큼 이동합니다.")
        
    }
    
    
    func destroy(something: String){
        print("\(something)을 부숩니다")
    }
    
    
    func turn(direction: Direction, count:Int){
        for i in 1...count{
            print("\(direction)으로 \(i)번 회전했습니다.")
        }
        
    }
    
    
    
    func turnAround(){//오른쪽으로 회전하는 함수
        self.turn(direction: Direction.right, count: 2)
    }
    

    //parameter로 class도 전달가능합니다.
    func meet(someone: Hero){
        print("\(self.name)가 \(someone.name)을 만나러 간다")
    }
    
    
    
}

let alex: Hero = Hero()
alex.destroy(something: "벽돌")
alex.moveForward(steps: 3)
alex.turn(direction: Direction.right, count: 3)
alex.turnAround()

let steve:Hero = Hero()
steve.name = "Steve"

alex.meet(someone: steve)

//while loop - control flow

var beer: Int = 0
var wine: Int = 0
var soju: Int = 0
var money: Int = 39500

while money>=10000{
    wine += 1
    money -= 10000
}

while money>=5000{
    beer += 1
    money -= 5000
}

while money>=2000{
    soju += 1
    money -= 2000
}

print("양주는 \(wine)병, 맥주는 \(beer)병, 소주는 \(soju)병, 잔액은 \(money)원입니다.")
