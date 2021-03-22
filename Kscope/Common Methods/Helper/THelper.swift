//
//  THelper.swift
//  Cricket
//

//  Copyright © 2019 "". All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import FCAlertView
import MBProgressHUD
import Toast_Swift

let MSG_REQUEST_PROGRESS = "Request in process"

func setGradient(_ startColor:String, endColor:String, bounds:CGRect) -> CAGradientLayer {
    let color1 = [UIColor(hex: startColor)]
    let color2 = [UIColor(hex: endColor)]

    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [color1, color2]
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    return gradientLayer
}

func getTeamImage(_ TeamName:String?) -> String {
    if (TeamName == "SL") {
        return "sl"
    }
    else if (TeamName == "ENG") {
        return "eng"
    }
    else if (TeamName == "AUS") {
        return "aus";
    }
    else if (TeamName == "IND") {
        return "ind";
    }
    else if (TeamName == "NZ") {
        return "nz";
    }
    else if (TeamName == "PAK") {
        return "pak";
    }
    else if (TeamName == "BAN") {
        return "ban";
    }
    else if (TeamName == "RSA") {
        return "rsa";
    }
    else if (TeamName == "WI") {
        return "wi";
    }
    else if (TeamName == "AFG") {
        return "afg";
    }
    else {
        return "";
    }
}

func getTeamKey(_ teamKey:String) -> String {
    if (teamKey == "South Africa"){
           return "RSA"
    }
    else if (teamKey == "India"){
        return "IND";
    }
    else if (teamKey == "Australia"){
        return "AUS";
    }
    else if (teamKey == "England"){
        return "ENG";
    }
    else if (teamKey == "Sri Lanka"){
        return "SL";
    }
    else if (teamKey == "New Zealand"){
        return "NZ";
    }
    else if (teamKey == "Pakistan"){
        return "PAK";
    }
    else if (teamKey == "Bangladesh"){
        return "BAN"
    }
    else if (teamKey == "Windies") || (teamKey == "West Indies"){
        return "WI"
    }
    else if (teamKey == "Afghanistan"){
        return "AFG"
    }
    else{
        return "";
    }
}

func getGroundImage(_ groundName:String?) -> String {
    
    if (groundName?.contains("Taunton"))! {
        return "county_ground_tauton.jpg"
    }
    else if (groundName?.contains("London"))! {
        return "lord's_london.jpg"
    }
    else if (groundName?.contains("Manchester"))! {
        return "old_trafford_manchester.jpg";
    }
    else if (groundName?.contains("Bristol"))! {
        return "county_ground_bristol.jpg";
    }
    else if (groundName?.contains("Irmingham"))! {
        return "edgbaston_irmingham.jpg";
    }
    else if (groundName?.contains("Leeds"))! {
        return "headingley_leeds.jpg";
    }
    else if (groundName?.contains("Chester Le Street"))! {
        return "riverside_ground_chester_le_street.jpg";
    }
    else if (groundName?.contains("Southampton"))! {
        return "rose_bowl_southampton.jpg";
    }
    else if (groundName?.contains("Cardiff"))! {
        return "sophia_gardens.jpg";
    }
    else if (groundName?.contains("Kennington"))! {
        return "the_oval.jpg";
    }
    else if (groundName?.contains("Nottingham"))! {
        return "trent_bridge_nottingham.jpg";
    }
    else {
        return "";
    }
}

func getVenueImage(_ groundName:String?) -> String {
    if (groundName?.contains("County Ground, Taunton"))! {
        return "county_ground_tauton"
    }
    else if (groundName?.contains("Edgbaston, Birmingham"))! {
        return "Birmingham";
    }
    else if (groundName?.contains("Lord's, London"))! {
        return "lord's_london"
    }
    else if (groundName?.contains("Old Trafford, Manchester"))! {
        return "old_trafford_manchester";
    }
    else if (groundName?.contains("County Ground, Bristol"))! {
        return "county_ground_bristol";
    }
    else if (groundName?.contains("Irmingham"))! {
        return "edgbaston_irmingham";
    }
    else if (groundName?.contains("Headingley, Leeds"))! {
        return "headingley_leeds";
    }
    else if (groundName?.contains("Riverside Ground, Chester-le-Street"))! {
        return "riverside_ground_chester_le_street";
    }
    else if (groundName?.contains("Rose Bowl, Southampton"))! {
        return "rose_bowl_southampton";
    }
    else if (groundName?.contains("Sophia Gardens, Cardiff"))! {
        return "sophia_gardens";
    }
    else if (groundName?.contains("The Oval, London"))! {
        return "the_oval";
    }
    else if (groundName?.contains("Trent Bridge, Nottingham"))! {
        return "trent_bridge_nottingham";
    }
    else {
        return "";
    }
}

func getHistoryImage(_ year:String?) -> String {
    if (year?.contains("1975"))! {
        return "1975"
    }else if (year?.contains("1979"))!{
        return "1979"
    }else if (year?.contains("1983"))!{
        return "1983"
    }else if (year?.contains("1987"))! {
        return "1987"
    }else if (year?.contains("1992"))! {
        return "1992"
    }else if (year?.contains("1996"))! {
        return "1996"
    }else if (year?.contains("1999"))! {
        return "1999"
    }else if (year?.contains("2003"))! {
        return "2003"
    }else if (year?.contains("2007"))! {
        return "2007"
    }else if (year?.contains("2011"))! {
        return "2011"
    }else if (year?.contains("2015"))! {
        return "2015"
    }else {
        return ""
    }
}


func setTintColor(_ imageView: UIImageView?, tintColor color: UIColor?) -> UIImageView? {
    imageView?.image = imageView?.image?.withRenderingMode(.alwaysTemplate)
    if let color = color {
        imageView?.tintColor = color
    }
    return imageView
}



func displayImage(_ vc: UIViewController?, imageView: UIImageView?) {
    // Create image info
//    let imageInfo = JTSImageInfo()
 //  /
    // Setup view controller
   // let imageView = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.image, backgroundStyle: JTSImageViewControllerBackgroundOptions.blurred)
    // Present the view controller.
   // imageView?.show(from: vc, transition: JTSImageViewControllerTransition.fromOriginalPosition)
}

func CricketJson(resource:String) -> NSDictionary {
    var json = NSDictionary()
    if let path = Bundle.main.path(forResource: resource, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSDictionary
        } catch {
            print("Something went wrong")
        }
    }
    return json
}

func SetGradientColorBackGround(view: UIView) -> CALayer {
    let gradient = CAGradientLayer()
    gradient.colors = [UIColor.CricketColor2().cgColor, UIColor.CricketColor1().cgColor]
    gradient.startPoint = CGPoint(x: 1, y: 0.3)
    gradient.endPoint = CGPoint(x: 0, y: 1)
    gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    return gradient
}

func backgroundColorChanged(color : UIColor) {
    BackgroundSettings.sharedService.backgroundColor = color;
}

func setImageTintColor(_ imageView: UIImageView?, tintColor color: UIColor?) -> UIImageView? {
    imageView?.image = imageView?.image?.withRenderingMode(.alwaysTemplate)
    if let aColor = color {
        imageView?.tintColor = aColor
    }
    return imageView
}

func setButtonTintColor(_ button: UIButton?, imageName: String?, state: UIControl.State, tintColor color: UIColor?) -> UIButton? {
    button?.setImage((UIImage(named: imageName ?? ""))?.withRenderingMode(.alwaysTemplate), for: state)
    button?.tintColor = color
    return button
}

func setFontFamily(_ fontFamily: String?, view: UIView?, size: Float, textColor: UIColor) {//, andSubViews isSubViews: Bool
    if (view is UILabel) {
        let lbl = view as? UILabel
        lbl?.font = UIFont(name: fontFamily ?? "", size: CGFloat(size))
        lbl?.textColor = textColor
    }
    else if (view is UIButton) {
        let btn = view as? UIButton
        btn?.titleLabel?.font =  UIFont(name: fontFamily ?? "", size: CGFloat(size))
        btn?.setTitleColor(textColor, for: .normal)
    }
    else if (view is UITextField) {
        let txt = view as? UITextField
        txt?.font = UIFont(name: fontFamily ?? "", size: CGFloat(size))
        txt?.textColor = textColor
    }
}

func fontSize(size: Float) -> Float {
    if IPAD {
        if size == QIBUS_SIZE_XXXLARGE {
            return 40
        }
        else if size == QIBUS_SIZE_XXLARGE {
            return 34
        }
        else if size == QIBUS_SIZE_XLARGE {
            return 24
        }
        else if size == QIBUS_SIZE_LARGE {
            return 24
        }
        else if size == QIBUS_SIZE_NORMAL {
            return 22
        }
        else if size == QIBUS_SIZE_MEDIUM {
            return 20
        }
        else if size == QIBUS_SIZE_MSMALL {
            return 18
        }
        else if size == QIBUS_SIZE_SMALL {
            return 16
        }
        else if size == QIBUS_SIZE_TINY {
            return 14
        }
        else {
            return 14
        }
    }
    else {
        if size == QIBUS_SIZE_XXXLARGE {
            return 35
        }
        else if size == QIBUS_SIZE_XXLARGE {
            return 30
        }
        else if size == QIBUS_SIZE_XLARGE {
            return 24
        }
        else if size == QIBUS_SIZE_LARGE {
            return 20
        }
        else if size == QIBUS_SIZE_NORMAL {
            return 18
        }
        else if size == QIBUS_SIZE_MEDIUM {
            return 16
        }
        else if size == QIBUS_SIZE_MSMALL {
            return 14
        }
        else if size == QIBUS_SIZE_SMALL {
            return 12
        }
        else if size == QIBUS_SIZE_TINY {
            return 10
        }
        else {
            return 10
        }
    }
}

func CornerRadiousWithShadow(view: UIView?, cornerRadus: CGFloat) {
    view?.layer.cornerRadius = cornerRadus
    view?.layer.shadowColor = UIColor.black.cgColor
    view?.layer.shadowOpacity = 0.3
    view?.layer.shadowRadius = 1.0
    view?.layer.shadowOffset = CGSize.zero
}

func CornerRadious(view: UIView?, cornerRadus: CGFloat) {
    view?.layer.cornerRadius = cornerRadus
    view?.layer.masksToBounds = true
}

func CornerRadiousWithBackground(view: UIView?, color: UIColor, cornerRadus: CGFloat) {
    view?.backgroundColor = color
    view?.layer.cornerRadius = cornerRadus
    view?.layer.masksToBounds = true
}

func CornerRadiousWithBorder(view: UIView?, color: UIColor, cornerRadus: CGFloat, borderWidth: CGFloat) {
    view?.layer.borderWidth = borderWidth
    view?.layer.borderColor = color.cgColor
    view?.layer.cornerRadius = cornerRadus
    view?.layer.masksToBounds = true
}

func Shadow(view: UIView?) {
    view?.layer.shadowColor = UIColor.black.cgColor
    view?.layer.shadowOpacity = 0.3
    view?.layer.shadowRadius = 1.0
    view?.layer.shadowOffset = CGSize.zero
    view?.layer.masksToBounds = false
}

func RemoveCornerRadiousWithShadow(view: UIView?) {
    view?.layer.cornerRadius = 0
    view?.layer.shadowColor = UIColor.clear.cgColor
    view?.layer.shadowOpacity = 0.0
    view?.layer.shadowRadius = 0.0
    view?.layer.shadowOffset = CGSize.zero
}

func Share(view: UIViewController) {
    // set up activity view controller
    let share = [""]
    let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = view.view // so that iPads won't crash
    
    // present the view controller
    view.present(activityViewController, animated: true, completion: nil)
}

func SegmentApprience(segment: UISegmentedControl) {
    let segSelectedAttributes: NSDictionary = [
        NSAttributedString.Key.foregroundColor: UIColor(hexString: QIBUS_BTN_TEXT_COLOR),
        NSAttributedString.Key.font: UIFont(name: QIBUS_PRIMARY_FONT_SEMIBOLD, size: CGFloat(fontSize(size: QIBUS_SIZE_MSMALL)))!
    ]
    segment.setTitleTextAttributes(segSelectedAttributes as? [NSAttributedString.Key : Any], for: .selected)
    
    let segNormalAttributes: NSDictionary = [
        NSAttributedString.Key.foregroundColor: UIColor(hexString: QIBUS_PRIMARY_TEXT_COLOR),
        NSAttributedString.Key.font: UIFont(name: QIBUS_PRIMARY_FONT_SEMIBOLD, size: CGFloat(fontSize(size: QIBUS_SIZE_MSMALL)))!
    ]
    segment.setTitleTextAttributes(segNormalAttributes as? [NSAttributedString.Key : Any], for: .normal)
}

class THelper {
    
    class func setTintColor(_ imageView: UIImageView?, tintColor color: UIColor?) -> UIImageView? {
        imageView?.image = imageView?.image?.withRenderingMode(.alwaysTemplate)
        if let aColor = color {
            imageView?.tintColor = aColor
        }
        return imageView
    }
    
    class func setButtonTintColor(_ button: UIButton?, imageName: String?, state: UIControl.State, tintColor color: UIColor?) -> UIButton? {
        button?.setImage((UIImage(named: imageName ?? ""))?.withRenderingMode(.alwaysTemplate), for: state)
        button?.tintColor = color
        return button
    }
    
    class func removeSpecialCharactersAndAlphabatics(_ string: String?) -> String? {
        let notAllowedChars = CharacterSet(charactersIn: "0123456789").inverted
        return string?.components(separatedBy: notAllowedChars).joined(separator: "")
    }
    
    class func removeWhitespaceAndNewline(_ string: String?) -> String? {
        if string == nil {
            return ""
        }
        print(string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) ?? "")
        let replaced = string?.trimmingCharacters(in: NSCharacterSet.whitespaces)
        return replaced
//        return string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    class func displayAlert(_ view: UIViewController?, title: String?, message: String?) {
        let alert = FCAlertView()
        alert.titleFont = UIFont(name: SHOPHOP_PRIMARY_FONT, size: CGFloat(SHOPHOP_SIZE_MEDIUM))
        alert.subtitleFont = UIFont(name: SHOPHOP_PRIMARY_FONT, size: CGFloat(SHOPHOP_SIZE_SMALL))
        alert.titleColor = UIColor.SHOPHOP_primaryColor()
        alert.doneButtonTitleColor = UIColor.SHOPHOP_primaryColor()
        alert.showAlert(inView: view, withTitle: title, withSubtitle: message, withCustomImage: nil, withDoneButtonTitle: "OK", andButtons: nil)
    }
    
    class func displayAlert(_ view: UIViewController?, title: String?, message: String?, tag: Int, firstButton: String?, doneButton: String?) {
        let alert = FCAlertView()
        alert.titleFont = UIFont(name: SHOPHOP_PRIMARY_FONT, size: CGFloat(SHOPHOP_SIZE_MEDIUM))
        alert.subtitleFont = UIFont(name: SHOPHOP_PRIMARY_FONT, size: CGFloat(SHOPHOP_SIZE_SMALL))
        alert.titleColor = UIColor.SHOPHOP_primaryColor()
        alert.doneButtonTitleColor = UIColor.SHOPHOP_primaryColor()
        alert.firstButtonTitleColor = UIColor.SHOPHOP_primaryColor()
        alert.tag = tag
        alert.delegate = view as? FCAlertViewDelegate
        alert.showAlert(inView: view, withTitle: title, withSubtitle: message, withCustomImage: nil, withDoneButtonTitle: doneButton, andButtons: [firstButton as Any])
        //    [alert addButton:firstButton withActionBlock:nil];
    }
    
    class func displayImage(_ vc: UIViewController?, imageView: UIImageView?) {
        // Create image info
       // let imageInfo = JTSImageInfo()
//        imageInfo.image = imageView?.image
//        imageInfo.referenceRect = (imageView?.frame)!
//        imageInfo.referenceView = imageView?.superview
//        imageInfo.referenceContentMode = (imageView?.contentMode)!
//        imageInfo.referenceCornerRadius = (imageView?.layer.cornerRadius)!
        // Setup view controller
     //   let imageView = JTSImageViewController(imageInfo: imageInfo, mode: JTSImageViewControllerMode.image, backgroundStyle: JTSImageViewControllerBackgroundOptions.blurred)
        // Present the view controller.
      //  imageView?.show(from: vc, transition: JTSImageViewControllerTransition.fromOriginalPosition)
    }
    
    class func toast(_ message: String? , vc: UIViewController) {
//        iToast.makeText(message).setDuration(1000).show()
        vc.view.makeToast(message)
    }
    
    class func convertLocalDatetoSeraverDate(_ strdate: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let datecurrunt = strdate
        let date: Date? = dateFormatter.date(from: datecurrunt ?? "")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let aDate = date {
            return dateFormatter.string(from: aDate)
        }
        return nil
    }
    
    //convert server date to local UserFormated Date
    
    class func convertLocaldate(_ str: String?) -> String? {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date: Date? = dateFormatter1.date(from: str ?? "")
        
        let currentTimeZone = NSTimeZone.local as NSTimeZone //Local time zone
        let utcTimeZone = NSTimeZone(abbreviation: "UTC")
        
        var currentGMTOffset: Int? = nil
        if let aDate = date {
            currentGMTOffset = currentTimeZone.secondsFromGMT(for: aDate)
        }
        var gmtOffset: Int? = nil
        if let aDate = date {
            gmtOffset = utcTimeZone?.secondsFromGMT(for: aDate)
        }
        let gmtInterval = TimeInterval((currentGMTOffset ?? 0) - (gmtOffset ?? 0))
        
        var destinationDate: Date? = nil
        if let aDate = date {
            destinationDate = Date(timeInterval: gmtInterval, since: aDate)
        }
        let dateFormatters = DateFormatter()
        dateFormatters.dateFormat = "dd/MM/yyyy"
        dateFormatters.timeZone = NSTimeZone.system
        if let aDate = destinationDate {
            return dateFormatters.string(from: aDate)
        }
        return nil
    }
    
    class func convertLocaldateServerdate(_ str: String?) -> String? {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd/MM/yyyy"
        let date: Date? = dateFormatter1.date(from: str ?? "")
        
        let currentTimeZone = NSTimeZone.local as NSTimeZone //Local time zone
        let utcTimeZone = NSTimeZone(abbreviation: "UTC")
        
        var currentGMTOffset: Int? = nil
        if let aDate = date {
            currentGMTOffset = currentTimeZone.secondsFromGMT(for: aDate)
        }
        var gmtOffset: Int? = nil
        if let aDate = date {
            gmtOffset = utcTimeZone?.secondsFromGMT(for: aDate)
        }
        let gmtInterval = TimeInterval((currentGMTOffset ?? 0) - (gmtOffset ?? 0))
        
        var destinationDate: Date? = nil
        if let aDate = date {
            destinationDate = Date(timeInterval: gmtInterval, since: aDate)
        }
        let dateFormatters = DateFormatter()
        dateFormatters.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateFormatters.timeZone = NSTimeZone.system
        if let aDate = destinationDate {
            return dateFormatters.string(from: aDate)
        }
        return nil
    }
    
    class func convert24Hours(_ str12Time: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let date: Date? = dateFormatter.date(from: str12Time ?? "")
        
        dateFormatter.dateFormat = "HH:mm:ss"
        if let aDate = date {
            return dateFormatter.string(from: aDate)
        }
        return nil
    }
    
    class func convert12Hours(_ str24Time: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date: Date? = dateFormatter.date(from: str24Time ?? "")
        
        dateFormatter.dateFormat = "hh:mm a"
        if let aDate = date {
            return dateFormatter.string(from: aDate)
        }
        return nil
    }

    class func dateFormatter(_ date1: String?, format1: String?, format2: String?) -> String? {
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

    class func setImageName() -> String? {
        let y = Double(Date().timeIntervalSince1970) * 11
        var strDouble = "\(y)"
        let arr = strDouble.components(separatedBy: ".")
        if !(arr.isEmpty) && arr.count > 1 {
            strDouble = strDouble.replacingOccurrences(of: ".", with: "")
        }
        return "IMG_\(strDouble).JPG"
    }
    
    class func setImageName(name :String) -> String? {
        let y = Double(Date().timeIntervalSince1970) * 11
        var strDouble = "\(y)"
        let arr = strDouble.components(separatedBy: ".")
        if !(arr.isEmpty) && arr.count > 1 {
            strDouble = strDouble.replacingOccurrences(of: ".", with: "")
        }
        return "IMG_\(name)_\(strDouble).JPG"
    }
    
    class func setDocumentName(extantion :String) -> String! {

            let y = Double(Date().timeIntervalSince1970) * 11
            var strDouble = "\(y)"
            let arr = strDouble.components(separatedBy: ".")
            if arr.count > 1 {
                strDouble = strDouble.replacingOccurrences(of: ".", with: "")
            }
            return "Attachment_\(strDouble).\(extantion)"
    }
    
    class func setImage(img :UIImageView, url :URL, placeholderImage :String){
//        img.sd_setShowActivityIndicatorView(true)
//        img.sd_setIndicatorStyle(.gray)
       // img.sd_setImage(with: url, placeholderImage: UIImage(named: placeholderImage))
    }
    
//    convert date format in only date and month
    class func convertdatetoonlyDM(_ strdate: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let datecurrunt = strdate
        let date: Date? = dateFormatter.date(from: datecurrunt ?? "")
        dateFormatter.dateFormat = "dd/MM"
        if let aDate = date {
            return dateFormatter.string(from: aDate)
        }
        return nil
    }
    
    class func ShowProgress(vc: UIViewController) {
        let hud = MBProgressHUD.showAdded(to: vc.view, animated: true)
        hud.mode = .indeterminate
        hud.label.text = MSG_REQUEST_PROGRESS
    }
    
    class func hideProgress(vc: UIViewController) {
        _ = MBProgressHUD.hide(for: vc.view, animated: true)
    }
    
    class func attributeText(price: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: price)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
    
    class func plist(type: String) -> NSMutableDictionary? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = "\(paths)/\(type).plist"
        let fileManager = FileManager.default
        if (!(fileManager.fileExists(atPath: path))) {
            let bundle : NSString = Bundle.main.path(forResource: "\(type)", ofType: "plist")! as NSString
            do {
                try fileManager.copyItem(atPath: bundle as String, toPath: path)
            } catch {
                print("copy failure.")
            }
        }
        else{
            print("file \(type).plist not found.")
        }
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        return resultDictionary
    }
    
    class func writeToFile(type: String, resultDictionary: NSMutableDictionary?) {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = "\(paths)/\(type).plist"
        
        resultDictionary?.write(toFile: path, atomically: true)
    }
    
    class func ProductData(resource: String) -> NSArray {
        var json = NSArray()
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
            } catch {
                print("Something went wrong")
            }
        }
        return json
    }

    class func convertArrayToString (arr: NSMutableArray) {
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: arr)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        TPreferences.writeString(SHOPHOP_RECENT_SEARCH, value: jsonString)
    }
    
    class func getArray() -> NSArray {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_RECENT_SEARCH)) {
            arr = TPreferences.readObject(SHOPHOP_RECENT_SEARCH) as! NSArray
            return arr
        }
        else {
            return []
        }
    }
    
    class func getAddress() -> NSArray {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_ADDRESS)) {
            arr = TPreferences.readObject(SHOPHOP_ADDRESS) as! NSArray
            return arr
        }
        else {
            return []
        }
    }
    
    class func getCartArray() -> NSArray {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_NEXT_TIME_BUY)) {
            arr = TPreferences.readObject(SHOPHOP_NEXT_TIME_BUY) as! NSArray
            return arr
        }
        else {
            return []
        }
    }
    
    class func getCart() -> NSArray {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_ARRCARTLIST)) {
            arr = TPreferences.readObject(SHOPHOP_ARRCARTLIST) as! NSArray
            return arr
        }
        else {
            return []
        }
    }
    
    class func getCartCount() -> Int {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_CART)) {
            arr = TPreferences.readObject(SHOPHOP_CART) as! NSArray
            return arr.count
        }
        else {
            return 0
        }
    }
    
    class func getOrder() -> NSArray {
        var arr = NSArray()
        if TValidation.isArray(TPreferences.readObject(SHOPHOP_ARRORDERLIST)) {
            arr = TPreferences.readObject(SHOPHOP_ARRORDERLIST) as! NSArray
            return arr
        }
        else {
            return []
        }
    }
    
    class func getAppVersion() -> String {
        let appVersion:String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        return appVersion
    }
    
    class func getAppName() -> String {
        let appName:String = Bundle.main.infoDictionary!["CFBundleName"] as! String
        return appName
    }
    
    class func openLink(url:String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    class func setShadow(view:UIView) {
        view.layer.shadowColor   = UIColor.lightGray.cgColor;
        view.layer.shadowRadius  = 1.0;
        view.layer.shadowOpacity = 0.5;
        view.layer.shadowOffset  = CGSize(width: 1.0, height: 3.0);
        view.layer.masksToBounds = false;
    }
    
    class func setHeaderShadow(view:UIView) {
        view.layer.shadowColor   = UIColor.lightGray.cgColor;
        view.layer.shadowRadius  = 5.0;
        view.layer.shadowOpacity = 0.8;
        view.layer.shadowOffset  = CGSize.zero;
        view.layer.masksToBounds = false;
    }
    
    class func setShadowWithColor(view:UIView, Color: String) {
        view.layer.shadowColor   = UIColor.init(hexString: "(Color)").cgColor;
        view.layer.shadowRadius  = 4.0;
        view.layer.shadowOpacity = 0.10;
        view.layer.shadowOffset  = CGSize(width: 0, height: 0);
        view.layer.masksToBounds = false;
    }
    
    class func setborder(view:UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    class func setRoundShadow(view:UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
    }
    
    class func setShadowImg(view:UIView) {
        view.layer.shadowColor   = UIColor.lightGray.cgColor;
        view.layer.shadowRadius  = 1.0;
        view.layer.shadowOpacity = 0.5;
        view.layer.shadowOffset  = CGSize(width: 0.0, height: 0.0);
        view.layer.masksToBounds = false;
    }
    
    class func btnsetShadowWithColor(view:UIView, Color: String) {
        view.layer.shadowColor   = UIColor.init(hexString: "\(Color)").cgColor;
        view.layer.shadowRadius  = 2.0;
        view.layer.shadowOpacity = 0.6;
        view.layer.shadowOffset  = CGSize(width: 0.0, height: 3.0);
        view.layer.masksToBounds = false;
    }
    
    class func setGradientWithColor(startColor:String, endColor:String, bounds:CGRect ) -> CAGradientLayer {
        let color1 = [UIColor(hex: startColor)]
        let color2 = [UIColor(hex: endColor)]

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        return gradientLayer
        
    }
    
    class func Gradient(startColor:String, endColor:String) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.init(hexString: "\(startColor)").cgColor, UIColor.init(hexString: "\(endColor)").cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return gradient
    }
    
    class func AnimateToClose(vc: UIViewController) {
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
           vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
           vc.view.layoutIfNeeded()
           vc.view.backgroundColor = UIColor.clear
           }, completion: { (finished) -> Void in
               vc.view.removeFromSuperview()
               vc.removeFromParent()
       })
    }
    
    class func btnAnimation(btn: UIButton) {
        btn.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            btn.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
    }
    
    class func btnAnimationLong(btn: UIButton) {
        btn.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            btn.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
    }
    
    class func ListAnimation(view: UIView) {
        let transform = CATransform3DTranslate(CATransform3DIdentity, 100, 50, 20)
        view.layer.transform = transform
        UIView.animate(withDuration: 0.5, animations:
        {
            view.layer.transform = CATransform3DIdentity
        })
    }
    
    class func setTheme11BackgroundGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        gradientLayer.colors = [UIColor.Theme11_Color1_Gradient().cgColor, UIColor.Theme11_Color2_Gradient().cgColor]
        return gradientLayer
    }
    
    class func HeaderBottomShadow(vw: UIView) {
        vw.layer.shadowColor = UIColor.init(hexString: COMMON_SHADOW_COLOR, alpha: 0.5).cgColor
        vw.layer.masksToBounds = false
        vw.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        vw.layer.shadowOpacity = 0.3
        vw.layer.shadowRadius = 2.0
    }
    
    class func attributeTextLine(Text: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: Text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    class func removeAttributeTextLine(Text: String) -> NSMutableAttributedString {
       let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: Text)
       attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSMakeRange(0, attributeString.length))
       return attributeString
    }
    
    class func BankingSetGradient(view: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.init(hexString: BANKING_YELLOWCOLOR).cgColor, UIColor.init(hexString: BANKING_PRIMARY).cgColor]
        gradient.frame.size = view.frame.size
        gradient.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.layer.addSublayer(gradient)
    }
    
}
