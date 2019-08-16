//
//  SecondViewController.swift
//  KUTransition0805
//
//  Created by cscoi008 on 2019. 8. 5..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //메모리에 뷰가 로드됩니다.
        
        self.view.backgroundColor = UIColor.gray
        //로드된 뷰의 색을 gray로 지정합니다.
        print("view did load")
    }
    
    //view가 보여지기 직전에 실행될 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.label?.alpha = 0
        
        print("view will appear")
    }
    
    //view가 완전히 보여진 이후 실행될 함수
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5){
            self.label?.alpha = 1
        }
        
        print("view did appear")
    }
    
    @IBAction func dissmissSelf() {
        self.dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
