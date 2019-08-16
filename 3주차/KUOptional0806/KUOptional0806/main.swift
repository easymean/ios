//  optional ?의 의미 - 빈 메모리 공간에 접근하기
//  main.swift
//  KUOptional0806
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation

//initializer를 사용합니다.
//swift는 변수 선언시 초기값이 무조건 필요합니다.
class Person{
    var name: String
    var weight: Double? = nil
    //정보가 없음을 나타냅니다.
    var room: Apartment?
    
    init(name: String){
        self.name = name
    
    }
}

class Apartment {
    var roomNumber: Int
    var resident: Person?
    
    init(room: Int){
        self.roomNumber = room
    }


}


let yagom: Person = Person.init(name: "yagom")
let mina: Person = Person.init(name: "mina")


let towerPalace : Apartment = Apartment.init(room: 101)
yagom.room = towerPalace
towerPalace.resident = yagom


if let room = yagom.room{
    print("\(yagom.name)의 집은 \(room.roomNumber)호입니다.")
} else {
    print("집 없음")
}

yagom.room = nil
towerPalace.resident = nil

if let room = yagom.room {
    print("\(yagom.name)의 집은 \(room.roomNumber)호입니다.")
} else {
    print("집 없음")
}

let weight: Double? = yagom.room?.resident?.weight

let name: String? = yagom.room?.resident?.name

print(weight, name)

if let weight: Double = yagom.room?.resident?.weight{
    print(weight)
}
//yagom.room이 있고 .resident가 있고 weight가 있으면 weight를 출력 하나라도 없으면 nill값 출력


yagom.weight = 56.09
yagom.room = towerPalace
towerPalace.resident = yagom

if let weight: Double = yagom.room?.resident?.weight{
    print(weight)
}




