//
//  ViewController.swift
//  project2
//
//  Created by cscoi008 on 2019. 8. 5..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var constraintX: NSLayoutConstraint
        constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constraintY: NSLayoutConstraint
        constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        constraintX.isActive = true
        constraintY.isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonContraintX: NSLayoutConstraint
        buttonContraintX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        
        var topConstraint: NSLayoutConstraint
        topConstraint = label.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -10)
        
        buttonContraintX.isActive = true
        topConstraint.isActive = true
        
        var widthContstraint: NSLayoutConstraint
        widthContstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, constant: 2)
        
        label.backgroundColor = UIColor.brown
        button.backgroundColor = UIColor.blue
        
        widthContstraint.isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

