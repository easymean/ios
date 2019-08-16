//  클래스의 property를 다른 클래스로 선언
//  main.swift
//  KU0802_MVC
//
//  Created by cscoi008 on 2019. 8. 2..
//  Copyright © 2019년 cscoi008. All rights reserved.
//  자료에 관한 클래스, 화면에 제시하는 클래스, 앞에 두 개를 연결하는 클래스 : mvc
//  view는 인터페이스 역할만 합니다.

import Foundation

//영웅의 정보를 나타내는 클래스 선언
class Hero {
    var name: String = "Alex"
    var age: Int = 0
    var xPosition: Int = 0
    var yPosition: Int = 0
}


//사용자에게 영웅의 정보를 출력하는 클래스
class Printer {
    
    func printCurrentPosition(x: Int, y: Int){
        print("현재 좌표는 \(x), \(y)입니다.")
        
    }
    
    func printName(name: String){
        print("이름은 \(name)입니다")
    }
    
    func printAge(age: Int){
        print("나이는 \(age)입니다")
    }

}


//서로 다른 두 클래스의 객체를 조종하는 클래스
class HeroController {
    
    var hero: Hero = Hero()
    var printer: Printer = Printer()
    
    
    func moveHero(toX: Int, y: Int){
        hero.xPosition = toX
        hero.yPosition = y
        printer.printCurrentPosition(x: toX, y: y)
    }
    
    
    func changeHeroName(name: String){
        hero.name = name
        printer.printName(name: name)
        
    }
    
    
    func changeHeroAge(age: Int){
        hero.age = age
        printer.printAge(age: age)
    }
    
    
    
}



let controller: HeroController = HeroController()
controller.changeHeroName(name: "ww")
controller.changeHeroAge(age: 20)
controller.moveHero(toX: 50, y: 50)
















