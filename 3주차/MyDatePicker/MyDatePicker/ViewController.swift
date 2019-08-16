//
//  ViewController.swift
//  MyDatePicker
//
//  Created by cscoi008 on 2019. 8. 6..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dataLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "yyyy MM/dd hh:mm"
        /*
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        */
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        print("date changed")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dataLabel.text = dateString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

