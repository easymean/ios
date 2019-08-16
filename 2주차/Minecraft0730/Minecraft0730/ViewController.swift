//
//  ViewController.swift
//  Minecraft0730
//
//  Created by cscoi008 on 2019. 7. 30..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

//반복횟수를 설정합니다.
var stepsToMove: Int = 0

class Hero : UIView{
    var name: String = "Alex"
    
    
    @objc func moveDown(){
        
        let viewHeight = superview!.frame.size.height
        let frameHeight = self.frame.size.height
        
        for _ in 0...stepsToMove{
            if stepsToMove != 0 && self.frame.origin.y < viewHeight-frameHeight{
                self.frame.origin.y += 30
            }
        }
    }
    
    @objc func moveUp(){
        
        for _ in 0...stepsToMove{
            if stepsToMove != 0 && self.frame.origin.y > 0{
                self.frame.origin.y -= 30
            }
        }
    }
    
    @objc func moveRight(){
        
        let viewWidth = superview!.frame.size.width
        let frameWidth = self.frame.size.width
        
        for _ in 0...stepsToMove{
            if stepsToMove != 0 && self.frame.origin.x < viewWidth-frameWidth{
                self.frame.origin.x += 30
            }
        }
    }
    
    @objc func moveLeft(){
        
        for _ in 0...stepsToMove{
            if stepsToMove != 0 && self.frame.origin.x > 0 {
                self.frame.origin.x -= 30
            }
        }
    }
    
}

//ViewController는 전체를 관리하는 view입니다.
class ViewController: UIViewController {
    
    let alex: Hero = Hero()
    let stepper: UIStepper = UIStepper()
    let numberLabel: UILabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //전체 view를 초록색, alex는 갈색으로 설정합니다.
        self.view.backgroundColor = UIColor.green
        self.alex.backgroundColor = UIColor.brown
        
        
        //alex의 크기를 설정합니다.
        let mainViewSize: CGSize = self.view.frame.size
        self.alex.frame = CGRect(x: 0,
                                 y: 0,
                                 width: mainViewSize.width / 5,
                                 height: mainViewSize.height / 8)
        
        //화면에 alex view를 추가합니다.
        self.view.addSubview(self.alex)
        
        //화면에 추가할 버튼을 생성합니다.
        let downButton: UIButton = UIButton(type: UIButtonType.system)
        downButton.setTitle("DOWN", for: UIControlState.normal)
        downButton.addTarget(alex, action: #selector(alex.moveDown),
                             for: UIControlEvents.touchUpInside)
        
        let upButton: UIButton = UIButton(type: UIButtonType.system)
        upButton.setTitle("UP", for: UIControlState.normal)
        upButton.addTarget(alex, action: #selector(alex.moveUp),
                             for: UIControlEvents.touchUpInside)
        
        
        let rightButton: UIButton = UIButton(type: UIButtonType.system)
        rightButton.setTitle("RIGHT", for: UIControlState.normal)
        rightButton.addTarget(alex, action: #selector(alex.moveRight),
                             for: UIControlEvents.touchUpInside)
        
        
        let leftButton: UIButton = UIButton(type: UIButtonType.system)
        leftButton.setTitle("LEFT", for: UIControlState.normal)
        leftButton.addTarget(alex, action: #selector(alex.moveLeft),
                             for: UIControlEvents.touchUpInside)
        
        
        //화면 상단 좌측 빨간 숫자를 제시합니다.
        self.numberLabel.text = "0"
        self.numberLabel.textColor = UIColor.red
        
        
        //스텝퍼를 초기화합니다.
        self.stepper.value = 0
        self.stepper.minimumValue = 0
        self.stepper.isContinuous = false
        self.stepper.stepValue = 1
        self.stepper.addTarget(self, action:#selector(stepperValueChanged(_:)),
                               for: UIControlEvents.valueChanged)
        
        
        // 화면에 버튼을 추가시킵니다. up이 제일 위에, 그 아래 left, right, 그 아래 down을 추가합니다.
        // 스텝퍼를 맨 위에 위치시킵니다.
        let hStack4: UIStackView = UIStackView(arrangedSubviews:
            [numberLabel, stepper])
        hStack4.alignment = UIStackViewAlignment.center
        hStack4.axis = .horizontal
        hStack4.distribution = .fill
        hStack4.spacing = 8
        // mainViewSize.height는 화면 맨 아래부터 시작합니다.
        hStack4.frame = CGRect(x: 0, y: mainViewSize.height - 176, width: mainViewSize.width, height: 44)
        self.view.addSubview(hStack4)
        
        
        let hStack3: UIStackView = UIStackView(arrangedSubviews:
            [upButton])
        hStack3.alignment = UIStackViewAlignment.center
        hStack3.axis = .horizontal
        hStack3.distribution = .fillEqually
        hStack3.spacing = 8
        // mainViewSize.height는 화면 맨 아래부터 시작합니다.
        hStack3.frame = CGRect(x: 0, y: mainViewSize.height - 132, width: mainViewSize.width, height: 44)
        self.view.addSubview(hStack3)
    
        
        let hStack: UIStackView = UIStackView(arrangedSubviews:
        [leftButton, rightButton])
        hStack.alignment = UIStackViewAlignment.center
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 8
        hStack.frame = CGRect(x: 0, y: mainViewSize.height - 88, width: mainViewSize.width, height: 44)
        self.view.addSubview(hStack)
        
        
        let hStack2: UIStackView = UIStackView(arrangedSubviews:
            [downButton])
        hStack2.alignment = UIStackViewAlignment.center
        hStack2.axis = .horizontal
        hStack2.distribution = .fillEqually
        hStack2.spacing = 8
        hStack2.frame = CGRect(x: 0, y: mainViewSize.height - 44, width: mainViewSize.width, height: 44)
        self.view.addSubview(hStack2)
        
        
    }

    // numberLabel에 stepsToMove변수를 연결합니다.
    @objc func stepperValueChanged(_ sender: UIStepper){
        stepsToMove = Int(sender.value)
        self.numberLabel.text = "\(stepsToMove)"
    }


}

