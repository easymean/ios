//
//  main.swift
//  KU0730
//
//  Created by cscoi008 on 2019. 7. 30..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import Foundation


class Ticket{
    var ticketId: Int = 0 // 티켓 고유 번호, 양의 정수로 표현합니다.
    var ticketPrice: Int = 0 // 티켓 가격, int형으로 표현합니다.
    var ticketName: String = "" // 공연 이름
    var ticketTime: String = "" //공연 시간, dictionary로 표현
    
    init(){
        
    }
}

/*
 let t1 = Ticket.init()
 */

class TicketBox{
    var buttonList: [String : Int] = ["티켓예매":1, "예매확인":2] // 각 명령 버튼을 배열에 저장합니다.
    // 1번은 티켓예매 2번은 예매확인....등등
    var moneyIn: Int = 0 //지불 금액
    var moneyOut: Int = 0 // 거스름 돈
    var selectedTicket: Int = 0 // 선택된 티켓 넘버, Ticket class의 ticketid와 동일합니다.
    var ticketPeopleNum: Int = 0// 뽑으려는 티켓 수
    var ticketList: [Int:String] = [1:"지젤"] //티켓 이름과 숫자를 저장합니다.
    var timePassed: Int = 0 // 각 단계에서 시작부터 걸린 시간: 초단위, 각 단계마다 0으로 초기화합니다.
    init(){
        
    }
    
    func viewButton(){
        //버튼을 표시합니다.
        for (name, number) in buttonList {
            print("\(number).\(name)")
        }
        
    }
    
    func viewList(){
        //현재 가능한 공연 리스트를 출력합니다.
        var totalNum: Int = ticketList.count
        
    }
    
    func printTicket(){
        //이용자가 선택한 티켓의 이름과 고유번호, 시간, 인원수를 출력합니다.
        //거스름돈을 출력합니다.
    }
    
    func selectTicket(){
        //viewList()
        //공연 티켓을 선택합니다.
        //인원수를 선택합니다.
        //printTicket()
    }
    
    func caculateChange(){
        //
    }
   
    
    func timeLimit(){
        //시간을 측정합니다.
        //각 단계마다 60초의 제한시간을 설정합니다. 제한 시간 초과시 처음 화면으로 돌아갑니다.
        //에러 메세지를 띄웁니다.
        
        if timePassed>60{
            print("제한 시간이 초과되었습니다.")
            viewList()
        }
    }
    
    
}




//반복문

//1 -3까지 똑같은 코드를 실행합니다.
for _ in 1...3 {
    print("하하")
}

for number in 1...5 {
    if number % 2 == 0{
        print("짝수번째 실행중...")
    }else {
        print("홀수번째 실행중...")
    }
}

var first: Int = 3
var last:Int = 7

for i in first...last {
    print(i)
}

//..<last는 last 미만을 의미한다.
for i in first..<last{
    print(i)
}




























