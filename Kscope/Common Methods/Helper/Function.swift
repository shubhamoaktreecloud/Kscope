//
//  Function.swift
//  Cricket
//

//  Copyright © 2018 "". All rights reserved.
//

import Foundation
import UIKit

func getFlag(name: String) -> String {
    let name = name.lowercased()

    if name == "eng" {
        return "bg_flag_england"
    }
    else if name == "rsa" {
        return "bg_flag_south_africa"
    }
    else if name == "wi" {
        return "bg_flag_west_indies"
    }
    else if name == "pak" {
        return "bg_flag_pakistan"
    }
    else if name == "nz" {
        return "bg_flag_new_zealand"
    }
    else if name == "sl" {
        return "bg_flag_sri_lanka"
    }
    else if name == "afg" {
        return "bg_flag_afghanistan"
    }
    else if name == "aus" {
        return "bg_flag_australia"
    }
    else if name == "ban" {
        return "bg_flag_bangladesh"
    }
    else if name == "ind" {
        return "bg_flag_india"
    }
    else {
        return "ic_blank_tranparent_ild"
    }
}

func getPointTableFlag(name: String) -> String {
    if name == "South Africa" {
        return "bg_head_southafrica"
    }
    else if name == "India" {
        return "bg_head_india"
    }
    else if name == "Australia" {
        return "bg_head_australia"
    }
    else if name == "England" {
        return "bg_head_england"
    }
    else if name == "Sri Lanka" {
        return "bg_head_srilanka"
    }
    else if name == "New Zealand" {
        return "bg_head_newzealand"
    }
    else if name == "Pakistan" {
        return "bg_head_pakistan"
    }
    else if name == "Bangladesh" {
        return "bg_head_bangladesh"
    }
    else if (name == "Windies") || (name == "West Indies") {
        return "bg_head_westindies"
    }
    else if name == "Afghanistan" {
        return "bg_head_afghanistan"
    }
    else {
        return ""
    }
}

func getLightColor(name: String) -> UIColor {
    if name == "eng" {
        return UIColor(hex: "#b41020")!
    }
    else if name == "rsa" {
        return UIColor(hex: "#e51837")!
    }
    else if name == "wi" {
        return UIColor(hex: "#7b0041")!
    }
    else if name == "pak" {
        return UIColor(hex: "#199b41")!
    }
    else if name == "nz" {
        return UIColor(hex: "#cd0e24")!
    }
    else if name == "sl" {
        return UIColor(hex: "#b63049")!
    }
    else if name == "afg" {
        return UIColor(hex: "#009900")!
    }
    else if name == "aus" {
        return UIColor(hex: "#ff0000")!
    }
    else if name == "ban" {
        return UIColor(hex: "#f02038")!
    }
    else if name == "ind" {
        return UIColor(hex: "#ff9933")!
    }
    else {
        return UIColor(hex: "#232883")!
    }
}

func getDarkColor(name: String) -> UIColor {
    if name == "eng" {
        return UIColor(hex: "#ce1124")!
    }
    else if name == "rsa" {
        return UIColor(hex: "#060709")!
    }
    else if name == "wi" {
        return UIColor(hex: "#7b0041")!
    }
    else if name == "pak" {
        return UIColor(hex: "#01411c")!
    }
    else if name == "nz" {
        return UIColor(hex: "#00247d")!
    }
    else if name == "sl" {
        return UIColor(hex: "#f0992a")!
    }
    else if name == "afg" {
        return UIColor(hex: "#000000")!
    }
    else if name == "aus" {
        return UIColor(hex: "#00008b")!
    }
    else if name == "ban" {
        return UIColor(hex: "#116903")!
    }
    else if name == "ind" {
        return UIColor(hex: "#138808")!
    }
    else {
        return UIColor(hex: "#cb3f96")!
    }
}

func getFlagImage(name: String) -> String {
    let name = name.lowercased()
    if name == "eng" {
        return "bg_head_england"
    }
    else if name == "rsa" {
        return "bg_head_southafrica"
    }
    else if name == "wi" {
        return "bg_head_westindies"
    }
    else if name == "pak" {
        return "bg_head_pakistan"
    }
    else if name == "nz" {
        return "bg_head_newzealand"
    }
    else if name == "sl" {
        return "bg_head_srilanka"
    }
    else if name == "afg" {
        return "bg_head_afghanistan"
    }
    else if name == "aus" {
        return "bg_head_australia"
    }
    else if name == "ban" {
        return "bg_head_bangladesh"
    }
    else if name == "ind" {
        return "bg_head_india"
    }
    else {
        return "ic_blank_tranparent2"
    }
}
func getTeam(name: String) -> String {
     let name1 = name.lowercased()
    if name1 == "rsa" {
        return "South Africa";
    } else if name1 == "ind" {
        return "India";
    } else if name1 == "aus" {
        return "Australia";
    } else if name1 == "eng" {
        return "England";
    } else if name1 == "sl" {
        return "Sri Lanka";
    } else if name1 == "nz" {
        return "New Zealand";
    } else if name1 == "pak" {
        return "Pakistan";
    } else if name1 == "ban" {
        return "Bangladesh";
    } else if name1 == "wi" {
        return "West Indies";
    } else if name1 == "afg" {
        return "Afghanistan";
    }
    return "";
}

func dateAndTime(_ strTimeStamp: String?) -> String? {
    let timeInterval = Double(strTimeStamp ?? "") ?? 0.0
    let date = Date(timeIntervalSince1970: TimeInterval(timeInterval))
    let df = DateFormatter()
    df.dateFormat = "dd-MM-yyyy hh:mm a"
    let strw = df.string(from: date)
    return strw
}

func dateFormatter(_ date1: String?, format1: String?, format2: String?) -> String? {
    var dateFormatter = DateFormatter() // here we create NSDateFormatter object for change the Format of date..
    dateFormatter.dateFormat = format1 ?? "" //// here set format of date which is in your output date (means above str with format)
    
    let date: Date? = dateFormatter.date(from: date1 ?? "") // here you can fetch date from string with define format
    
    dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format2 ?? "" // here set format which you want...
    
    if let aDate = date {
        return dateFormatter.string(from: aDate)
    }
    return nil
}

