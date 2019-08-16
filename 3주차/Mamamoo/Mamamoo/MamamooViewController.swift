//
//  MamamooViewController.swift
//  Mamamoo
//
//  Created by cscoi008 on 2019. 8. 9..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class MamamooViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var realNameBirthLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    var member: Mamamoo.memberInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yearOfBirth = String(member.yearOfBirth)
        realNameBirthLabel.text = member.realName + "(" + yearOfBirth + ")"
        positionLabel.text = member.position
        self.navigationItem.title = member.name
        let image = UIImage(named: member.imageName)
        imageView.image = image

    }


}
