//
//  TUILabel.swift
//  Cricket
//

//  Copyright © 2018 "". All rights reserved.
//

import UIKit

class TUILabel: UILabel {

    func setLabelFont(_ font: String?, color: UIColor?, size: Float) {
        self.font = UIFont(name: font ?? "", size: CGFloat(size))
        if let aColor = color {
            textColor = aColor
        }
    }
}
