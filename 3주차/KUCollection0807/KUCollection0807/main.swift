//  collections
//  main.swift
//  KUCollection0807
//
//  Created by cscoi008 on 2019. 8. 7..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation

//array
var names: [String] = ["a", "b", "c", "d"]

// 배열의 크기를 출력합니다.
print(names.count)

//배열의 맨 마지막에 데이터를 추가합니다.
names.append("e")
print(names)

//배열의 맨마지막에 여러 데이터를 추가합니다.
names.append(contentsOf:["h", "g"])

//배열에 위치를 지정해서 데이터를 추가합니다.
names.insert(contentsOf:["i","k"], at: 2)

//배열의 위치를 지정해서 데이터를 교환합니다.
names[0] = "f"
print(names)

//int에 해당하는 위치의 배열값을 지웁니다.
names.remove(at: 0)
print(names)

//배열의 nill값 오류를 피하기
if names.count>1{
    let second: String = names[1]
    print(second)
}

names.removeSubrange(1...2)
print(names)

//배열의 값이 있을 때 출력합니다.
if let first: String = names.first{
    print(first)
}

//배열이 비었는지 확인합니다.
print(names.isEmpty)

class Person{
    var name: String?
    var age: Int?
}

var friends: [Person] = []
let mini: Person = Person()

friends.append(mini)
print(friends[0].name)

friends.append(Person())

friends.append(Person())

friends.append(Person())

if friends.count>3 {
    if let friendName = friends[3].name{
        print(friendName)
    }
}


//directory
//키:value
var contacts: [String:String] = ["mini":"01012345678"]

let numOfMini = contacts["mini"]

//키와 밸류를 추가합니다.
contacts["yagom"] = "01022345645"

print(contacts)

var classmates: [Int:String] = [1:"길동", 2:"춘향"]


//키값을 사용해서 딕셔너리 데이터를 제거합니다.
classmates.removeValue(forKey: 2)

classmates[1] = nil

print(classmates)


var cats: [Int:String] = [1:"뽀또", 2:"짜장이", 3:"버찌"]

cats[4] = "카레"

cats.removeValue(forKey: 3)

print(cats)


print(cats[1, default: "카레"])


//any 형식
//타입확인의 필요성: any는 항상 타입을 확인해야 사용가능합니다.

var another: Any = 10
var any: Any = 20


if let anotherValue: Int = another as? Int, let anyValue: Int = any as? Int{
    let result: Int = anotherValue + anyValue
    print(result)
}


var arr: [Any] = [1,3.5, "abc", 6]
if let value = arr[3] as? String {
    print(value)
} else {
    print("문자열이 아닙니다")
}












