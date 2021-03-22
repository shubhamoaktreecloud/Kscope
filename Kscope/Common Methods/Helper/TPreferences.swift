//
//  TPreferences.swift
//

//  Copyright © 2018. All rights reserved.
//

import Foundation

let DEVICETOKEN_ID = "registration_id"
var NICKNAME = "nickname"

//Shophop

let SHOPHOP_WALKTHROUGH = "walk_through"
let SHOPHOP_ISLISTING = "listing"
let SHOPHOP_TOKEN = "token"
let SHOPHOP_USER_EMAIL = "user_email"
let SHOPHOP_USER_DISPLAY_NAME = "user_display_name"
let SHOPHOP_USER_NICENAME = "user_nicename"
let SHOPHOP_ID = "ID"
let SHOPHOP_USER_FIRST_NAME = "first_name"
let SHOPHOP_USER_LAST_NAME = "last_name"
let SHOPHOP_USER_ROLE = ""
let SHOPHOP_USERNAME = "username"
let SHOPHOP_PASSWORD = "password"
let SHOPHOP_IS_LOGGED_IN = "logged_in"

let SHOPHOP_PRODUCT_NAME = "name"
let SHOPHOP_SALES_PRICE = "sale_price"
let SHOPHOP_REGULAR_PRICE = "regular_price"
let SHOPHOP_CART_ITEM_COUNT = "cart_item_count"
let SHOPHOP_RECENT_SEARCH = "recent_search"
let SHOPHOP_ADDRESS = "address"
let SHOPHOP_SELECTED_ADDRESS = "selected_address"
let SHOPHOP_NEXT_TIME_BUY = "next_time_buy"
let SHOPHOP_CART = "cart"

let SHOPHOP_NEWEST_PRODUCT = "Newest Products"
let SHOPHOP_TOP_SELLING = "Top Selling"
let SHOPHOP_FEATURED_PRODUCTS = "Featured Products"
let SHOPHOP_NEW_ARRIVAL = "New Arrival"

let SHOPHOP_SHARE_KEY = "share_key"
let SHOPHOP_WISHLIST_COUNT = "Wishlist_Count"
let SHOPHOP_REWARD_COUNT = "Reward_Count"
let SHOPHOP_MY_ORDER_COUNT = "My_Order_Count"

let SHOPHOP_PRICE_SIGN = "$"
let SHOPHOP_CM = "cm"

let SHOPHOP_FASHION = "Fashion"
let SHOPHOP_KIDS = "Kids"
let SHOPHOP_CLOTHING = "Clothing"
let SHOPHOP_MEN = "Men"
let SHOPHOP_WOMEN = "Women"
let SHOPHOP_OPTICS = "Optics"
let SHOPHOP_BAGS = "Bags"
let SHOPHOP_WATCHES = "Watches"
let SHOPHOP_FOOTWEAR = "Footwear"
let SHOPHOP_SPORT = "Sport"
let SHOPHOP_DECOR = "Decor"
let SHOPHOP_ARRWISHLIST = "arrwishlist"
let SHOPHOP_ARRCARTLIST = "arrcartlist"
let SHOPHOP_QTY = "qty"

let SHOPHOP_ARRORDERLIST = "arrOrderList"

let QUIZ_ISLISTING = "listing"

let LEARNER_PRICE_SIGN = "$"

let THEME10_PRICE_SIGN = "$"

//Taxi
let ISLOGINRIDER = "isLoginRider"

class TPreferences {
    
    class func readString(_ key: String?) -> String? {
        var value = UserDefaults.standard.string(forKey: key ?? "")
        if value == nil {
            value = ""
        }
        return value
    }
    
    class func writeString(_ key: String?, value: String?) {
        if value == nil {
            UserDefaults.standard.setValue("", forKey: key!)
            return
        }
        UserDefaults.standard.setValue(value, forKey: key!)
    }
    
    class func removePreference(_ key: String?) {
        UserDefaults.standard.removeObject(forKey: key ?? "")
    }
    
    class func readBoolean(_ key: String?) -> Bool {
        let value: Bool = UserDefaults.standard.bool(forKey: key ?? "")
        return value
    }
    
    class func writeBoolean(_ key: String?, value: Bool) {
        UserDefaults.standard.set(value, forKey: key ?? "")
    }
    
    class func getURLString(_ urlString: String?) -> String? {
            print("\(BASEURL + ("user" + (urlString ?? "")))")
            return BASEURL + ("user" + (urlString ?? ""))
        }
    
        class func getCommonURL(_ urlString: String?) -> String? {
            print("\(BASEURL + (urlString ?? ""))")
            return BASEURL + (urlString ?? "")
        }
        
        class func writeObject(_ key: String?, value: Any?) {
            if value == nil {
                UserDefaults.standard.set("", forKey: key ?? "")
                return
            }
            let myData = NSKeyedArchiver.archivedData(withRootObject: value!)
            UserDefaults.standard.set(myData, forKey: key ?? "")
        }
        
        class func readObject(_ key: String?) -> Any? {
            let recovedUserJsonData = UserDefaults.standard.object(forKey: key ?? "")
            if recovedUserJsonData == nil {
                return ""
            }
            else {
                var value = NSKeyedUnarchiver.unarchiveObject(with: recovedUserJsonData as! Data)
                if value == nil {
                    value = ""
                }
                return value
            }
        }
}
