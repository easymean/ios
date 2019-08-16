//
//  BirdView.swift
//  flappy
//
//  Created by cscoi008 on 2019. 7. 26..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class BirdView: UIImageView {
    
    var name = "짹짹이"

    @IBAction func moveUp(){
        
        if self.frame.origin.y>=0 {
            
            self.frame.origin.y -= 30
            //앱의 (0,0)은 왼쪽 상단이기 때문.
            print("\(name)가 위로 난다~")
        
        }
    }
    
    @IBAction func moveDown(){
        
        //전체 뷰의 세로 길이
        let viewHeight = superview!.frame.size.height
        
        //사진의 세로 길이
        let frameHeight = self.frame.size.height
        
        if self.frame.origin.y<=(viewHeight-frameHeight) {
            self.frame.origin.y += 30
            //앱의 (0,0)은 왼쪽 상단이기 때문.
            print("\(name)가 아래로 난다~")
            
        }
    }
    
    
    @IBAction func moveRight(){
        
        //전체 뷰의 가로길이
        let viewWidth = superview!.frame.size.width
        
        //사진이 세로 길이
        let frameWidth = self.frame.size.width
        
        if self.frame.origin.x<=(viewWidth-frameWidth){
            self.frame.origin.x += 30
            print("\(name)가 오른쪽으로 난다~")
            
        }
    }
    
    @IBAction func moveLeft(){
        
        if self.frame.origin.x>=0 {
            self.frame.origin.x -= 30
            print("\(name)가 왼쪽으로 난다~")
            
        }
    }
}


