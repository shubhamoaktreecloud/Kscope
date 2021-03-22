//
//  Theme6ListCollectionCell.swift
//  Prokit
//
//  Created by ""-  on 17/12/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit
import Cosmos

class Theme6ListCollectionCell: UICollectionViewCell {

//    @IBOutlet weak var imgList: UIImageView!
    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var vwRatting: CosmosView!
    @IBOutlet var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imgList.layer.cornerRadius = 10
    }

}
