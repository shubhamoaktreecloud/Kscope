//
//  Theme1ListingCollectionViewCell.swift
//  Prokit
//
//  Created by ""-ios on 14/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit

class Theme1ListingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwDetail: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblColorLine: UILabel!
    @IBOutlet var sfdcIdLbl: UILabel!
    @IBOutlet var descriptionLbl: UITextView!
    @IBOutlet var detailBtn: UIButton!
    @IBOutlet var transparentBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
