//
//  Setting.swift
//  Booking
//
//  Created by ""-  on 21/06/19.
//  Copyright © 2019 "". All rights reserved.
//

import Foundation
import UIKit

class BackgroundSettings {
    
    class var sharedService : BackgroundSettings {
        struct Singleton {
            static let instance = BackgroundSettings()
        }
        return Singleton.instance
    }
    
    init() { }
    
    var backgroundColor : UIColor {
        get {
            let data: NSData? = UserDefaults.standard.object(forKey: "backgroundColor") as? NSData
            var returnValue: UIColor?
            if data != nil {
                returnValue = NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as? UIColor
            } else {
                returnValue = UIColor(white: 1, alpha: 1);
            }
            return returnValue!
        }
        set (newValue) {
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            UserDefaults.standard.set(data, forKey: "backgroundColor")
            UserDefaults.standard.synchronize()
        }
    }
}

class TextColorSettings {
    
    class var sharedService : TextColorSettings {
        struct Singleton {
            static let instance = TextColorSettings()
        }
        return Singleton.instance
    }
    
    init() { }
    
    var textColor : UIColor {
        get {
            let data: NSData? = UserDefaults.standard.object(forKey: "textColor") as? NSData
            var returnValue: UIColor?
            if data != nil {
                returnValue = NSKeyedUnarchiver.unarchiveObject(with: data! as Data) as? UIColor
            } else {
                returnValue = UIColor(white: 1, alpha: 1);
            }
            return returnValue!
        }
        set (newValue) {
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            UserDefaults.standard.set(data, forKey: "textColor")
            UserDefaults.standard.synchronize()
        }
    }
}
