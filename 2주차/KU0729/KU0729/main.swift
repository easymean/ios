//
//  main.swift
//  KU0729
//
//  Created by cscoi008 on 2019. 7. 29..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation

//값을 저장할 공간 변수와 상수 - var(변수), let(상수)
//var는 변수를 지정
var name = "jimin"
var age = 50
age = 25
print(name)
print("제 이름은 \(name)이고요, 나이는 \(age)입니다")

//let은 상수(변하지 않는 값)를 지정
let pi = 3.14
var radius = 4.0
var area = pi * radius * radius
print(area)

radius = 6.5
area = pi * radius * radius
print(area)

//:은 자료 타입을 설정합니다.
var newName:String = "dlwlals"
var height:Int = 25
var weight:Double  = 25.5


//변수의 이름짓기; 영어로 짓기, _를 쓰지 않는다, 줄여 쓰지 않는다
//변수이름, 상수이름, 함수이름 - 소문자로 시작, 카멜케이스 사용 smallLetterCamelCase
//타입이름, 클래스 이름 - 대문자로 시작; BigLetterCamelCase

//연산자; <, >, !=, ==, >=, <=

var a: Int = 100
var b: Int = 200

//if-else 조건문
if a<b {
    print("a는 b보다 작아요")
}else if a==b {
    print("a는 b랑 같아요")
}else {
    print("a는 b보다 커요")
}

b = 30
if a<b {
    print("a는 b보다 작아요")
}else if a==b {
    print("a는 b랑 같아요")
}else {
    print("a는 b보다 커요")
}


var c: Double = 3.89
var d: Double = 1.098

if c<d {
    print("c는 d보다 작다")
}else {
    print("c는 d와 같거나 크다")
}

//이름과 나이를 변수로 갖는 person 클래스 만들기
class Person{
    var name: String = "dlwlals"
    var age:Int = 20
    
    init(){
        
    }
}

let dlwlals: Person = Person.init()
let rlawlals: Person = Person.init()
dlwlals.age = 25
rlawlals.name = "rlawlals"
rlawlals.age = 45

//and: &&
//or: ||
if 19<dlwlals.age && 30>dlwlals.age {
    print("dlwlals은 20대")
}else if dlwlals.age<20{
    print("dlwlals은 10대")
}else{
    print("dlwlals은 30이상")
}

if rlawlals.age<20 || rlawlals.age>29{
    print("20대가 아닙니다.")
}

if dlwlals.age>20 || rlawlals.age>20 {
    print("최소 한명은 20대 이상")
}
