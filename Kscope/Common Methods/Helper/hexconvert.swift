//: Playground - noun: a place where people can play
import UIKit

typealias HexadecimalString = String

extension UIColor {
    
    //MARK: - Initialization F92C5B 12154E
    class func CricketVwSquadBgColor() -> UIColor {
        return UIColor(hex: CRICKET_SQUAD_BG_COLOR)!
    }
    
    class func CricketVwheaderBgColor() -> UIColor {
        return UIColor(hex: CRICKET_HEADER_BG_COLOR)!
    }
    
    class func CricketDidselectColor() -> UIColor {
        return UIColor(hex: CRICKET_DID_SELECT_COLOR)!
    }
    
    class func CricketBgColor() -> UIColor {
        return UIColor(hex: CRICKET_PRIMARY_COLOR)!
    }
    
    class func CricketColor1() -> UIColor {
        return UIColor(hex: CRICKET_COLOR1)!
    }
    class func CricketColor2() -> UIColor {
        return UIColor(hex: CRICKET_COLOR2)!
    }
    
    class func CricketTitleColor1() -> UIColor {
        return UIColor(hex: CRICKET_TITLE_COLOR1)!
    }
    class func CricketTitleColor2() -> UIColor {
        return UIColor(hex: CRICKET_TITLE_COLOR2)!
    }
    
    class func CricketTitleColor3() -> UIColor {
        return UIColor(hex: CRICKET_TITLE_COLOR3)!
    }
    class func CricketTitleColor4() -> UIColor {
        return UIColor(hex: CRICKET_TITLE_COLOR4)!
    }
    
    class func CricketPrimaryColorDark() -> UIColor {
        return UIColor(hex: CRICKET_PRIMARY_COLOR_DARK)!
    }

    class func CricketPrimaryColor() -> UIColor {
        return UIColor(hex: CRICKET_PRIMARY_COLOR)!
    }
    
    class func CricketPrimaryColorLight() -> UIColor {
        return UIColor(hex: CRICKET_PRIMARY_COLOR_LIGHT)!
    }
    
    class func CricketCellColor1() -> UIColor {
        return UIColor(hex: CRICKET_CELL_COLOR1)!
    }
    
    class func CricketCellColor2() -> UIColor {
        return UIColor(hex: CRICKET_CELL_COLOR2)!
    }
    
    //Shophop
    
    class func SHOPHOP_primaryColor() -> UIColor {
        return UIColor(hex: "#f17015")!
    }
    
    class func SHOPHOP_secondaryColor() -> UIColor {
        return UIColor(hex: "#fdabae")!
    }
    
    class func SHOPHOP_primaryTextColor() -> UIColor {
        return UIColor(hex: "#2b2b2b")!
    }
    
    class func SHOPHOP_secondaryTextColor() -> UIColor {
        return UIColor(hex: "#f4f4f4")!
    }
    
    //Furniture DashBoard
    class func FurnitureDashBoardprimaryColor() -> UIColor {
           return UIColor(hex: "#3D59BD")!
    }
    
    //Food
    class func Food_primaryColor() -> UIColor {
        return UIColor(hex: "#3B8BEA")!
    }
    
    class func Food_secondaryColor() -> UIColor {
        return UIColor(hex: "#f7b733")!
    }
    
    class func Food_primaryTextColor() -> UIColor {
        return UIColor(hex: "#333333")!
    }
    
    class func Food_secondaryTextColor() -> UIColor {
        return UIColor(hex: "#949292")!
    }
    
    //Theme2
    
    class func Theme2_primaryColor() -> UIColor {
        return UIColor(hex: "#7e05fa")!
    }
    
    class func Theme2_secondaryColor() -> UIColor {
        return UIColor(hex: "#5959fc")!
    }
    
    class func Theme2_primaryTextColor() -> UIColor {
        return UIColor(hex: "#2b2b2b")!
    }
    
    class func Theme2_secondaryTextColor() -> UIColor {
        return UIColor(hex: "#f4f4f4")!
    }
    
    //Theme3
    
    class func Theme3_primaryColor() -> UIColor {
        return UIColor(hex: "#fc4a1a")!
    }
    
    class func Theme3_secondaryColor() -> UIColor {
        return UIColor(hex: "#f7b733")!
    }
    
    class func Theme3_primaryTextColor() -> UIColor {
        return UIColor(hex: "#2b2b2b")!
    }
    
    class func Theme3_secondaryTextColor() -> UIColor {
        return UIColor(hex: "#f4f4f4")!
    }
    
    //Theme 5
    
    class func Theme5_primaryColor() -> UIColor {
        return UIColor(hex: "#5436DC")!
    }
    
    //Theme9
    class func Theme9_primaryColor() -> UIColor {
        return UIColor(hex: "#313384")!
    }
    
    //Theme11
    class func Theme11_primaryColor() -> UIColor {
        return UIColor(hex: THEME11_PRIMARYCOLOR)!
    }
    
    class func Theme11_Color1_Gradient() -> UIColor {
        return UIColor(hex: THEME11_COLOR1_GRADIENT)!
    }
    
    class func Theme11_Color2_Gradient() -> UIColor {
        return UIColor(hex: THEME11_COLOR2_GRADIENT)!
    }
    
//    DASHBOARD 8
    class func Dashboard8_PrimaryColor() -> UIColor {
        return UIColor(hex: DASHBOARD8_PRIMARYCOLOR)!
    }

    class func Dashboard8_PrimaryColor_Dark() -> UIColor {
        return UIColor(hex: DASHBOARD8_PRIMARYCOLOR_DARK)!
    }
    
    convenience init?(hex: HexadecimalString) {
        //prepare the hex string
        var hexProcessed = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexProcessed = hexProcessed.replacingOccurrences(of: "#", with: "")
        
        //set up variables
        //-
        //unsigned integer
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        //alpha default = 1.0
        var a: CGFloat = 1.0
        let length = hexProcessed.count
        
        //Scanning the string with scanner for unsigned values
        guard Scanner(string: hexProcessed).scanHexInt32(&rgb) else {
            return nil
        }
        
        //extract colors based on hex lenght
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }
        
        //Creating UIColor instance with extracted values
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    
    // MARK: - Computed Properties
    
    var hexString: HexadecimalString? {
        return hexString()
    }
    
    // MARK: - From UIColor to Hex String
    
    //One param: indicates if alpha value is included or not (bool)
    
    func hexString(alpha: Bool = false) -> HexadecimalString? {
        
        //Safely unwrapping because components property is type [CGFloat]?
        //Also mage sure that it contains a minimum of 3 components
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        //extract colors
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        //if there is an alpha value extract it too
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        //create return string, round values with lroundf
        //REMEMBER: - String formats:
        // % defines the format specifier
        // 02 defines the length of the string
        // l casts the value to an unsigned long
        // X prints the value in hexadecimal
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        }
        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
        
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//        return String(format:"#%06x", rgb)
//    }
}


// MARK: - Debugging
//
//let green = UIColor(hex: "12FF10")
//let greenWithAlpha = UIColor(hex: "12FF10AC")
//
//UIColor.blue.hexString
//UIColor.orange.hexString()
//UIColor.brown.hexString(alpha: true)
