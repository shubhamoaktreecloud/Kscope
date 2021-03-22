//
//  Theme2ListcellCollectionViewCell.swift
//  Prokit
//
//  Created by ""-ios on 16/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit

class ApplicantListcellCollectionViewCell: UICollectionViewCell {

//    @IBOutlet weak var vwDetail: UIView!
//    @IBOutlet weak var vwImageUp: UIView!
//    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet var appnameLbl: UILabel!
    @IBOutlet var genderLbl: UILabel!
    //    @IBOutlet weak var lblPopular: UILabel!
//    @IBOutlet weak var imgProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if #available(iOS 11.0, *) {
//            self.vwImageUp.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
//            self.lblNew.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
//            self.lblPopular.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        } else {
        
        }
//        self.lblNew.layer.cornerRadius = 5.0
//        self.lblPopular.layer.cornerRadius = 5.0
//        self.vwDetail.layer.cornerRadius = 5.0
//        self.vwImageUp.layer.cornerRadius = 5.0
    }

}
