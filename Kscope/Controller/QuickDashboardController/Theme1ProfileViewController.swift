//
//  Theme1ProfileViewController.swift
//  Prokit
//
//  Created by ""-ios on 13/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit
import ProgressHUD

struct application_stat_analysesModel:Codable{
    var application_stat_analyses : application_stat_analyses
}

struct application_stat_analyses:Codable {
     
    var total_awarded_this_year : Int? = nil
    var all_time_awarded_amount : Int? = nil
    var new_application_this_week : Int? = nil
    var new_application_ratio : Int? = nil
    var total_application_this_year : Int? = nil
    var total_application : Int? = nil
    var amount_disbursed_this_year : Int? = nil
    var remaining_to_disburs_this_year : Int? = nil
    var reviewer_count : Int? = nil
    
}

class Theme1ProfileViewController: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource,Theme12SlideMenuDelegate {
    func Theme12SlideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            
            break
        case 1:
            print("Play\n", terminator: "")
            
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    
    //MARK:-
    //MARK:- Outlets.
    
    @IBOutlet var totalAwardLbl: UILabel!
    @IBOutlet var totalwardThisyrLbl: UILabel!
    @IBOutlet var profileImg: UIImageView!
    var imageUrl : URL?
    var sfdcStr = ""
    var detailArr = (application_stat_analyses)()

    @IBOutlet var profileMainName: UITextView!
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    @IBOutlet var userMessageLbl: UILabel!
    @IBOutlet weak var vwUserDetail: UIView!
    @IBOutlet weak var vwPersonalDetail: UIView!
    @IBOutlet weak var vwContactDetail: UIView!
    
    @IBOutlet weak var vwProfile: UIView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var vwPopBackGround: UIView!
    
    @IBOutlet weak var vwPop: UIView!
    @IBOutlet weak var btnTryAgain: UIButton!
    
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var PickerView: UIPickerView!
    
    //MARK:-
    //MARK:- Variables
    
    var isPop = Bool()
    var arrGender = ["Male","Female","Other"]

    //MARK:-
    //MARK:- View Life Cycles.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProgressHUD.show("Loading...")
        // Do any additional setup after loading the view.
        SetUpObject()
        getServiceCall()
        let preferences = UserDefaults.standard
        let donor_instructions__c = preferences.value(forKey: "donor_instructions__c")

        let userfirst_name = preferences.value(forKey: "first_name")
        profileMainName.attributedText = NSAttributedString(html: donor_instructions__c as? String ?? "")
                
        userMessageLbl.text = "GOOD AFTERNOON,\(userfirst_name ?? "WARREN")!"
        
        if(imageUrl == nil)
        {
            self.profileImg.image = UIImage(named: "starbucks")
        }else{
            loadImg()
        }
    }
    
    
    func getServiceCall(){
        let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts/\(sfdcStr)/application_stats_analysis")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let preferences = UserDefaults.standard
        let currentToken = preferences.value(forKey: "token")
        request.setValue(currentToken as! String, forHTTPHeaderField: "Authorization")
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            let decoder = JSONDecoder()

            if let jsonPetitions = try? decoder.decode(application_stat_analysesModel.self, from: data!) {
                
                
                self.detailArr = jsonPetitions.application_stat_analyses
                
                DispatchQueue.main.async {
                    self.totalwardThisyrLbl.text =
                        "$\(self.detailArr.total_awarded_this_year ?? 0)"
                    self.totalAwardLbl.text = "$\(self.detailArr.all_time_awarded_amount ?? 0)"
                    self.txtUserName.text = "New Applicants (this week) - \(self.detailArr.new_application_this_week ?? 0)"
                    self.txtGender.text = "Total Applicants (lifetime)  - \(self.detailArr.total_application ?? 0)"
                    self.txtAddress.text = "Total Applicants (this year)  - \(self.detailArr.total_awarded_this_year ?? 0)"
                    self.txtMobileNo.text = "AMOUNT DISBURSED (this year) $\(self.detailArr.all_time_awarded_amount ?? 0)"
                    self.txtEmail.text = "REMAINING TO DISBURSED (this year) $\(self.detailArr.amount_disbursed_this_year ?? 0)"
                }
               
                ProgressHUD.dismiss()

            }
            
        }
        task.resume()
    }
    
    
    func loadImg(){
        getData(from: imageUrl!) { data, response, error in
               guard let data = data, error == nil else { return }
               DispatchQueue.main.async() { [weak self] in
                self?.profileImg.image = UIImage(data: data)
               }
           }
    }
    
    @IBAction func notificationBtnAction(_ sender: UIButton) {
        
        let vc = Theme8AchievementViewController(nibName: "Theme8AchievementViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func taskBtnAction(_ sender: UIButton) {
        
        let vc = Theme6ListViewController(nibName: "Theme6ListViewController", bundle: nil)
        vc.sfdcidStr = sfdcStr
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    //MARK:-
    //MARK:- SetUpObject Methods.
    
    func SetUpObject() {
        if #available(iOS 11.0, *) {
        } else {
            // Fallback on earlier versions
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        self.vwUserDetail.layer.cornerRadius = 7.0
        self.vwPersonalDetail.layer.cornerRadius = 7.0
        self.vwContactDetail.layer.cornerRadius = 7.0
        
        if isPop == true {
            self.vwPopBackGround.isHidden = false
            self.vwPop.isHidden = false
            self.vwPopBackGround.alpha = 0.5
            self.vwPop.alpha = 1.0
        }else {
            self.vwPopBackGround.isHidden = true
            self.vwPop.isHidden = true
            self.vwPopBackGround.alpha = 0.0
            self.vwPop.alpha = 0.0
        }
        
//        THelper.setShadowWithColor(view:self.vwUserDetail, Color: COMMON_SHADOW_COLOR)
//        THelper.setShadowWithColor(view:self.vwPersonalDetail, Color: COMMON_SHADOW_COLOR)
//        THelper.setShadowWithColor(view:self.vwContactDetail, Color: COMMON_SHADOW_COLOR)
        self.btnTryAgain.layer.cornerRadius = self.btnTryAgain.layer.frame.height / 2
        
        self.vwPop.layer.cornerRadius = 5.0
        self.vwProfile.layer.cornerRadius = self.vwProfile.layer.frame.height / 2
        self.vwProfile.layer.borderColor = UIColor.white.cgColor
        self.vwProfile.layer.borderWidth = 5.0
    }
    
    //MARK: -
    //MARK: - Picker View Delegate
          
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
          
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrGender.count
    }
          
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arrGender[row]
    }
          
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.txtGender.text = arrGender[row]
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events Methods.
    @IBAction func menuBtnAction(_ sender: UIButton) {
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.Theme12SlideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
      let menuVC = Theme12SideMenuViewController(nibName: "Theme12SideMenuViewController", bundle: nil)
      menuVC.btnMenu = sender
      menuVC.delegate = self
      
      addAnimation(view: menuVC, sender: sender)
    }
    
    
    func addAnimation(view: UIViewController, sender : UIButton) {
          self.view.addSubview(view.view)
          self.addChild(view)
          view.view.layoutIfNeeded()
          
          
          view.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
          
          UIView.animate(withDuration: 0.3, animations: { () -> Void in
              view.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
              sender.isEnabled = true
              }, completion:nil)
      }
    
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnClose_Clicked(_ sender: Any) {
        self.vwPopBackGround.isHidden = true
        self.vwPop.isHidden = true
        self.vwPopBackGround.alpha = 0.0
        self.vwPop.alpha = 0.0
    }
    
    @IBAction func btnDone_Clicked(_ sender: Any) {
        self.PickerView.isHidden = true
        self.btnDone.isHidden = true
    }
    
    @IBAction func btnTryAgain_Clicked(_ sender: Any) {
        self.vwPopBackGround.isHidden = true
        self.vwPop.isHidden = true
        self.vwPopBackGround.alpha = 0.0
        self.vwPop.alpha = 0.0
    }
    
    @IBAction func btnGender_Clicked(_ sender: Any) {
        self.PickerView.reloadAllComponents()
        self.PickerView.isHidden = false
        self.btnDone.isHidden = false
    }
}

