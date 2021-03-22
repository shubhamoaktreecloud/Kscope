//
//  Theme2ListcellCollectionViewCell.swift
//  Prokit
//
//  Created by ""-ios on 16/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit

class Theme2ListcellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet var openDateLbl: UILabel!
    @IBOutlet var dueDateLbl: UILabel!
    @IBOutlet var statsLbl: UILabel!
    @IBOutlet var blueImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if #available(iOS 11.0, *) {
           // self.vwImageUp.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
           // self.lblNew.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
           // self.lblPopular.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            self.blueImgView.layer.cornerRadius = 5.0
            self.blueImgView.layer.masksToBounds = true
        } else {
        
        }
//        self.lblNew.layer.cornerRadius = 5.0
//        self.lblPopular.layer.cornerRadius = 5.0
//        self.vwDetail.layer.cornerRadius = 5.0
//        self.vwImageUp.layer.cornerRadius = 5.0
    }

}
