//
//  Theme7SignInViewController.swift
//  Prokit
//
//  Created by ""-ios on 26/11/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit
import ProgressHUD

class Theme7SignInViewController: UIViewController {
    
    //MARK:-
    //MARK:- Outlets.
    let login_url = "https://digital-dev-api.herokuapp.com/api/v1/sign-in"
    
    @IBOutlet weak var vwDetail: UIView!
    @IBOutlet weak var vwContinue: UIView!
    @IBOutlet weak var btnRightArrow: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    @IBOutlet var username_input: UITextField!
    @IBOutlet var password_input: UITextField!
    
    //MARK:-
    //MARK:- UIview Life Cycles.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetUpObject()
    }
    
    //MARK:-
    //MARK:- SetUpObject Methods
    
    func SetUpObject() {
         if #available(iOS 11.0, *) {
               
         } else {
            // Fallback on earlier versions
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        self.navigationController?.isNavigationBarHidden = true

        self.btnRightArrow.layer.cornerRadius = self.btnRightArrow.layer.frame.height / 2
        self.vwDetail.layer.cornerRadius = 15.0
        self.vwContinue.layer.cornerRadius = 15.0
        self.vwContinue.layer.masksToBounds = false;
       // THelper.btnsetShadowWithColor(view: self.vwContinue, Color: THEME7_PRIMARY_COLOR2)
       // THelper.setShadowWithColor(view: self.vwDetail, Color: COMMON_SHADOW_COLOR)
    }
    
    
    //MARK:-
    //MARK:- UIButton Clicked Events.
    
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnContinue_Clicked(_ sender: Any) {
       // THelper.btnAnimationLong(btn: btnContinue)
        ProgressHUD.show("Loading...")

        login_now(username:username_input.text!, password: password_input.text!)
    }
    
    @IBAction func btnSignUp_Clicked(_ sender: Any) {
        
    }
    func login_now(username:String, password:String)
        {
            let post_data: NSDictionary = NSMutableDictionary()
            
            post_data.setValue(username, forKey: "email")
            post_data.setValue(password, forKey: "password")

            let url:URL = URL(string: login_url)!
            let session = URLSession.shared
            
            let request = NSMutableURLRequest(url: url)
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
                
            var paramString = ""
                
            for (key, value) in post_data
            {
                paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
            }
            request.httpBody = paramString.data(using: String.Encoding.utf8)
            let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
                data, response, error) in

                guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                        
                    return
                }
                let json: Any?
                
                do
                {
                    json = try JSONSerialization.jsonObject(with: data!, options: [])
                }
                catch
                {
                    return
                }
                guard let server_response = json as? NSDictionary else
                {
                    return
                }
                if (server_response["user"] as? NSDictionary) != nil
                {
                    let tokenOne = server_response["user"] as! NSDictionary
                    let saveToken = tokenOne["token"] as! String
                    let userFirstName = tokenOne["first_name"] as! String
                    print(saveToken)
                        let preferences = UserDefaults.standard
                        preferences.set("loggedInUser", forKey: "session")
                        preferences.set(saveToken, forKey: "token")
                        preferences.set(userFirstName, forKey: "first_name")
                        
                        DispatchQueue.main.async(execute: self.LoginDone)
                }else
                {
                    DispatchQueue.main.async(execute: {
                                                let alert = UIAlertController(title: "Kscope", message: "Invalid Login", preferredStyle: UIAlertController.Style.alert)
                                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                                self.present(alert, animated: true, completion: nil)                     })
                    ProgressHUD.dismiss()
                }
            })
            task.resume()
        }
        
        func LoginDone()
        {
            ProgressHUD.dismiss()
            let vc = Theme1ListingViewController(nibName: "Theme1ListingViewController", bundle: nil)
            let preferences = UserDefaults.standard
            preferences.set("singin", forKey: "checkcontroller")
            self.navigationController?.pushViewController(vc, animated: true)
            print("Successfully in")
        }
        

}
