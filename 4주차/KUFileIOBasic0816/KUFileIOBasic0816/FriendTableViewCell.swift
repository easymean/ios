//
//  FriendTableViewCell.swift
//  KUFileIOBasic0816
//
//  Created by cscoi008 on 2019. 8. 16..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet var nameField: UILabel!
    @IBOutlet var mobileField: UILabel!
    @IBOutlet var dateField: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
