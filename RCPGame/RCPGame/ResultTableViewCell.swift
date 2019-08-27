//
//  ResultTableViewCell.swift
//  RCPGame
//
//  Created by cscoi008 on 2019. 8. 19..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet var resultTableLabel: UILabel!
    @IBOutlet var dateTabelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
