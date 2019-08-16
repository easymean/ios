//
//  Mamamoo.swift
//  Mamamoo
//
//  Created by cscoi008 on 2019. 8. 9..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class Mamamoo: NSObject, Codable {
    
    var name: String!
    var titles: String!
    var members: [memberInfo]! = []
    
    class memberInfo: NSObject, Codable{
        var name: String!
        var yearOfBirth: Int!
        var realName: String!
        var position: String!
        var imageName: String!
    }
}
