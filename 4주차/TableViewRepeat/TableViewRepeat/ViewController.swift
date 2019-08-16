//
//  ViewController.swift
//  TableViewRepeat
//
//  Created by cscoi008 on 2019. 8. 12..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let defaultCellIdentifier: String = "cell"
    let model: Model = Model.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     
    //특정 section에 해당하는 Row 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.employee.count
    }
    
    //특정 indexPath(section과 row)에 해당하는 cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
        
        let employee: Person = model.employee[indexPath.row]
        cell.textLabel?.text = "\(employee.name)"
        cell.detailTextLabel?.text = "\(employee.num)"
        
        return cell
    }


}

