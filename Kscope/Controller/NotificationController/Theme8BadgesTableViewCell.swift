//
//  Theme8BadgesTableViewCell.swift
//  Prokit
//
//  Created by ""-ios on 05/12/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit

class Theme8BadgesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var vwImageBackGround: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
