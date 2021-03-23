//
//  Theme1ListingViewController.swift
//  Prokit
//
//  Created by ""-ios on 14/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit



class Theme1ListingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK:-
    //MARK:- Outlets.
    
    @IBOutlet weak var ContraintSafeArea: NSLayoutConstraint!
    
    @IBOutlet weak var cvListing: UICollectionView!
    
    var AccountsArr = [Accounts]()
    var arrName = ["John Smith"]
    var arrProfile = ["Theme1Pro1"]
    let arrTypeColor = ["fc4d4d"]

    @IBOutlet var menuBtn: VKExpandableButton!
    //MARK:-
    //MARK:- UIView Life Cycles.Theme1ListingCell
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetUpObject()
        getServiceCall()
        
    }
    
    func getServiceCall(){
        let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts")
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

            if let jsonPetitions = try? decoder.decode(AccountResponseModel.self, from: data!) {
                self.AccountsArr = jsonPetitions.accounts
                }
            print(self.AccountsArr)
            DispatchQueue.main.async() {
            self.cvListing.reloadData()
            }
            
        }
        task.resume()
    }
        
    //MARK:-
    //MARK:- SetUpObject Methods
    
    func SetUpObject() {
        if #available(iOS 11.0, *) {
            
        } else {
            // Fallback on earlier versions
            ContraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    //MARK:-
    //MARK:- UICollectionView Delegate and Data Sources.
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.AccountsArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cvListing.register(UINib(nibName: "Theme1ListingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Theme1ListingCell")
        let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "Theme1ListingCell", for: indexPath) as! Theme1ListingCollectionViewCell
        cell.lblName.text = AccountsArr[indexPath.row].name
        cell.vwDetail.layer.cornerRadius = 7.0
        cell.imgProfile.layer.cornerRadius = 3.0
        cell.sfdcIdLbl.text = AccountsArr[indexPath.row].sfid
//        cell.descriptionLbl.a = AccountsArr[indexPath.row].donor_instructions__c
        cell.detailBtn.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        cell.detailBtn.tag = indexPath.row
        cell.detailBtn.layer.cornerRadius = 10.0
        cell.detailBtn.layer.masksToBounds = true
        
        
        cell.transparentBtn.addTarget(self, action: #selector(connectedOne(sender:)), for: .touchUpInside)
        cell.transparentBtn.tag = indexPath.row

        cell.descriptionLbl.attributedText = NSAttributedString(html: AccountsArr[indexPath.row].donor_instructions__c!)

       // cell.lblColorLine.backgroundColor = UIColor.init(hexString: "\(arrTypeColor[indexPath.item])")
       /// THelper.setShadowWithColor(view:cell.vwDetail, Color: COMMON_SHADOW_COLOR)
        
      //  THelper.ListAnimation(view: cell)
        
        if(AccountsArr[indexPath.row].account_logo_url__c == nil)
        {
            cell.imgProfile.image = UIImage(named: "starbucks")
        }else
        {
            getData(from: AccountsArr[indexPath.row].account_logo_url__c!) { data, response, error in
                   guard let data = data, error == nil else { return }
                   DispatchQueue.main.async() { [weak self] in
                    cell.imgProfile.image = UIImage(data: data)
                   }
               }
        }
        return cell
    }
    
    @objc func connected(sender: UIButton){

        let preferences = UserDefaults.standard

        let vc = Theme1ProfileViewController(nibName: "Theme1ProfileViewController", bundle: nil)
        vc.sfdcStr = AccountsArr[sender.tag].sfid
        
        preferences.set(AccountsArr[sender.tag].sfid, forKey: "current_sfid")

        
        vc.imageUrl = AccountsArr[sender.tag].account_logo_url__c
        preferences.set(AccountsArr[sender.tag].account_logo_url__c, forKey: "account_logo_url__c")
        preferences.set(AccountsArr[sender.tag].name, forKey: "name")
        preferences.set(AccountsArr[sender.tag].total_applicants__c, forKey: "total_applicants__c")
        preferences.set(AccountsArr[sender.tag].new_applicants_this_week__c, forKey: "new_applicants_this_week__c")
        preferences.set(AccountsArr[sender.tag].total_live_scholarship, forKey: "total_live_scholarship")
        preferences.set(AccountsArr[sender.tag].donor_instructions__c, forKey: "donor_instructions__c")
        
        if((AccountsArr[sender.tag].amount_awarded__c) == nil)
        {
            preferences.set("\(0)", forKey: "amount_awarded__c")
        }else
        {
            preferences.set("\(AccountsArr[sender.tag].amount_awarded__c!)", forKey: "amount_awarded__c")
        }
        
        if((AccountsArr[sender.tag].all_time_awarded_amount) == nil)
        {
            preferences.set("\(0)", forKey: "all_time_awarded_amount")
        }else
        {
            preferences.set("\(AccountsArr[sender.tag].all_time_awarded_amount!)", forKey: "all_time_awarded_amount")
        }
        
        if((AccountsArr[sender.tag].all_time_disbursement_amount) == nil)
        {
            preferences.set("\(0)", forKey: "all_time_disbursement_amount")
        }else
        {
            preferences.set("\(AccountsArr[sender.tag].all_time_disbursement_amount!)", forKey: "all_time_disbursement_amount")

        }
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func connectedOne(sender: UIButton){
        
        let preferences = UserDefaults.standard

        let vc = Theme1ProfileViewController(nibName: "Theme1ProfileViewController", bundle: nil)
        vc.sfdcStr = AccountsArr[sender.tag].sfid
        
        preferences.set(AccountsArr[sender.tag].sfid, forKey: "current_sfid")

        
        vc.imageUrl = AccountsArr[sender.tag].account_logo_url__c
//        preferences.set(AccountsArr[sender.tag].account_logo_url__c, forKey: "account_logo_url__c")
//        preferences.set(AccountsArr[sender.tag].name, forKey: "name")
//        preferences.set(AccountsArr[sender.tag].total_applicants__c, forKey: "total_applicants__c")
//        preferences.set(AccountsArr[sender.tag].new_applicants_this_week__c, forKey: "new_applicants_this_week__c")
//        preferences.set(AccountsArr[sender.tag].total_live_scholarship, forKey: "total_live_scholarship")
//        preferences.set(AccountsArr[sender.tag].donor_instructions__c, forKey: "donor_instructions__c")
        
//        if((AccountsArr[sender.tag].amount_awarded__c) == nil)
//        {
//            preferences.set("\(0)", forKey: "amount_awarded__c")
//        }else
//        {
//            preferences.set("\(AccountsArr[sender.tag].amount_awarded__c!)", forKey: "amount_awarded__c")
//        }
//        
//        if((AccountsArr[sender.tag].all_time_awarded_amount) == nil)
//        {
//            preferences.set("\(0)", forKey: "all_time_awarded_amount")
//        }else
//        {
//            preferences.set("\(AccountsArr[sender.tag].all_time_awarded_amount!)", forKey: "all_time_awarded_amount")
//        }
//        
//        if((AccountsArr[sender.tag].all_time_disbursement_amount) == nil)
//        {
//            preferences.set("\(0)", forKey: "all_time_disbursement_amount")
//        }else
//        {
//            preferences.set("\(AccountsArr[sender.tag].all_time_disbursement_amount!)", forKey: "all_time_disbursement_amount")
//
//        }
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
   
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        if (UIDevice.current.userInterfaceIdiom == .pad){
            return CGSize(width: cvListing.frame.width - 40, height: 220)
        }else
        {
            return CGSize(width: cvListing.frame.width - 32, height: 150)
        }
    }
  
    //MARK:-
    //MARK:- UIButton Clicked Events Methods.
      
      @IBAction func btnBack_Clicked(_ sender: Any) {
          self.navigationController?.popViewController(animated: true)
      }

}


