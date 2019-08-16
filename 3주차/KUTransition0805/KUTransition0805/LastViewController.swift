//
//  LastViewController.swift
//  KUTransition0805
//
//  Created by cscoi008 on 2019. 8. 5..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class LastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //메모리에 뷰가 로드됩니다.
        
        self.view.backgroundColor = UIColor.gray
        print("view did load")
    }
    
    
    //pop view
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //go to root view
    @IBAction func goRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
