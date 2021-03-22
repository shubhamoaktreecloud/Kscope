//
//  ReviewCollectionViewCell.swift
//  Kscope
//
//  Created by Mac on 28/01/21.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var deadlineLbl: UILabel!
    @IBOutlet var reviewBoardLbl: UILabel!
    @IBOutlet var progressLbl: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
