//
//  MyInfo.swift
//  KUSingletoneSample0808
//
//  Created by cscoi008 on 2019. 8. 8..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit



//객체를 단 한번만 만들어서 사용하는 경우
class MyInfo: NSObject {
    
    var name: String?
    var age: String?
    
    
    
    static let shared: MyInfo = MyInfo()
    

}
