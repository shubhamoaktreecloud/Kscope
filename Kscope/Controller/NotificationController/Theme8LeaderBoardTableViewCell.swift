//
//  Theme8LeaderBoardTableViewCell.swift
//  Prokit
//
//  Created by ""-ios on 05/12/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit

class Theme8LeaderBoardTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTilte: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var vwCount: UIView!
    @IBOutlet weak var vwMain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
