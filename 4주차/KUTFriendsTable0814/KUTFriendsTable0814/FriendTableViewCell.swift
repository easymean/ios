//
//  FriendTableViewCell.swift
//  KUTFriendsTable0814
//
//  Created by cscoi008 on 2019. 8. 14..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
