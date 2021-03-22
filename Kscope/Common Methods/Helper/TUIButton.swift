//
//  TUIButton.swift
//  Cricket
//

//  Copyright © 2018 "". All rights reserved.
//

import UIKit

class TUIButton: UIButton {

    func setImage(_ image: String?, selectedImage: String?) {
        setImage(UIImage(named: image ?? ""), for: .normal)
        setImage(UIImage(named: selectedImage ?? ""), for: .selected)
    }
    
    func setButtonLabelFont(_ font: String?, color: UIColor?, size: Float) {
        if let aSize = UIFont(name: font ?? "", size: CGFloat(size)) {
            titleLabel?.font = aSize
        }
        setTitleColor(color, for: .normal)
    }
    
    func setBorderWidth(_ width: Float, color: UIColor?) {
        layer.borderColor = color?.cgColor
        layer.borderWidth = CGFloat(width)
    }
}
