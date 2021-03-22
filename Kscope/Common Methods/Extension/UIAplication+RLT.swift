//
//  UIAplication+RLT.swift
//  ParallaxHeader
//

//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit


extension UIApplication {
    
    static var isRTL: Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == UIUserInterfaceLayoutDirection.rightToLeft
    }
}

