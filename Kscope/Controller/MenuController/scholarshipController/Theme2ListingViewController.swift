//
//  Theme2ListingViewController.swift
//  Prokit
//
//  Created by ""-ios on 16/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit
import ProgressHUD
import KRPullLoader

struct Accounts :Codable {
    var id: Int?
    var sfid : String
    var name : String?
    var account_logo_url__c : URL? = nil
//    var primary_color__c : String? = nil
//    var secondary_color__c : String? = nil
    var remaining_balance__c : Int? = nil
    var amount_awarded__c : Int? = nil
    var new_applicants_this_week__c : Int? = nil
    var total_applicants__c : Int? = nil
    var donor_instructions__c : String? = nil
    var total_live_scholarship : Int? = nil
//    var reviewer_progress : String? = nil
    var all_time_awarded_amount : Int? = nil
    var all_time_disbursement_amount : Int? = nil
}

class Theme2ListingViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,Theme12SlideMenuDelegate, KRPullLoadViewDelegate {
        
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
    //MARK:- Outlets
    
    var AccountsArr = [String]()
    var MainTableArr = [scholarshipsModelNw]()
    var OpenTableArr = [scholarshipsModelNw]()
    @IBOutlet weak var cvCategary: UICollectionView!
    @IBOutlet weak var cvListing: UICollectionView!
    @IBOutlet weak var ContraintSafeArea: NSLayoutConstraint!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    
    //MARK:-
    //MARK:- Variables.
    
    var arrCategaries = [ScholarshipsModel]()
    var arrCategariesOpen = [ScholarshipsModel]()
    var arrImg = ["Theme2List1","Theme2List2","Theme2List3","Theme2List1","Theme2List2","Theme2List3"]
    var arrTitle = ["Flower Tips","Health Tips","Food Tips","Health Tips","Flower Tips","Health Tips"]
    var arrType = ["New","Popular","New","Popular","New","Popular"]
    var SelectedIndex = Int()
    var selectedIndexMe = Int()
    
    //MARK:-
    //MARK:- UIView Life Cycles.
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        SetUpObject()
        ProgressHUD.show("Loading...")
        getServiceCall(pageCount: 0)
        selectedIndexMe = 0
        
        let refreshView = KRPullLoadView()
        refreshView.delegate = self
        cvListing.addPullLoadableView(refreshView, type: .loadMore)
    }
    
    //MARK: Delegate of loadmore
    func pullLoadView(_ pullLoadView: KRPullLoadView, didChangeState state: KRPullLoaderState, viewType type: KRPullLoaderType) {
        
        getServiceCall(pageCount: 1)
        
    }
    
    func getServiceCall(pageCount: Int){
        
        ProgressHUD.show("Loading...")
        let preferences = UserDefaults.standard
        
        let currentsfid = preferences.value(forKey: "current_sfid")
        
        if(pageCount == 0)
        {
            let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts/\(currentsfid!)/scholarships")
            guard let requestUrl = url else { fatalError() }
            // Create URL Request0016s000005DnR2AAK
            var request = URLRequest(url: requestUrl)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
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

                if let jsonPetitions = try? decoder.decode(MainJsonObject.self, from: data!) {
                    print(jsonPetitions)
                    self.arrCategaries = jsonPetitions.persona_branding.sub_tabs.Scholarships
                    self.MainTableArr = jsonPetitions.scholarships
                    
                    self.AccountsArr.removeAll()
                    if(self.arrCategaries[0].subtab_name__c == "Scholarships")
                    {
                        guard let arrOne = self.arrCategaries[0].table_headers[0].column_name__c else { return  }
                        guard let arrTwo = self.arrCategaries[0].table_headers[1].column_name__c else { return  }
                        guard let arrThree = self.arrCategaries[0].table_headers[2].column_name__c else { return }
                        guard let arrFour = self.arrCategaries[0].table_headers[3].column_name__c else { return }
                        
                        
                        
                        self.AccountsArr.append(arrOne)
                        self.AccountsArr.append(arrTwo)
                        self.AccountsArr.append(arrThree)
                        self.AccountsArr.append(arrFour)
                        
                    }
                }
                DispatchQueue.main.async() {
                ProgressHUD.dismiss()
                self.cvListing.reloadData()
                self.cvCategary.reloadData()
                self.subCategoryCollectionView.reloadData()
                }
            }
            task.resume()
        }else
        {
            let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts/\(currentsfid!)/scholarships?page=2")
            guard let requestUrl = url else { fatalError() }
            // Create URL Request0016s000005DnR2AAK
            var request = URLRequest(url: requestUrl)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
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

                if let jsonPetitions = try? decoder.decode(MainJsonObject.self, from: data!) {
                    print(jsonPetitions)
                    self.arrCategaries = jsonPetitions.persona_branding.sub_tabs.Scholarships
                    let tempArr = jsonPetitions.scholarships
                    self.MainTableArr.append(contentsOf: tempArr)
                    
                    self.AccountsArr.removeAll()
                    if(self.arrCategaries[0].subtab_name__c == "Scholarships")
                    {
                        guard let arrOne = self.arrCategaries[0].table_headers[0].column_name__c else { return  }
                        guard let arrTwo = self.arrCategaries[0].table_headers[1].column_name__c else { return  }
                        guard let arrThree = self.arrCategaries[0].table_headers[2].column_name__c else { return }
                        guard let arrFour = self.arrCategaries[0].table_headers[3].column_name__c else { return }
                        
                        
                        
                        self.AccountsArr.append(arrOne)
                        self.AccountsArr.append(arrTwo)
                        self.AccountsArr.append(arrThree)
                        self.AccountsArr.append(arrFour)
                        
                    }
                }
                DispatchQueue.main.async() {
                ProgressHUD.dismiss()
                self.cvListing.reloadData()
                self.cvCategary.reloadData()
                self.subCategoryCollectionView.reloadData()
                }
            }
            task.resume()
        }
    }
    //MARK:- SetUpObject Methods
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
        if collectionView == self.cvListing {
            if(selectedIndexMe == 0 || selectedIndexMe == 1){
                return self.MainTableArr.count
            }else{
                return 1
            }
            
        }else if collectionView == self.cvCategary {
            return self.arrCategaries.count
        }else if collectionView == self.subCategoryCollectionView
        {
            return self.AccountsArr.count
        }
        else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cvListing {
            
            if(selectedIndexMe == 0)
            {
                cvListing.register(UINib(nibName: "Theme2ListcellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Theme2ListingCell")
                let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "Theme2ListingCell", for: indexPath) as! Theme2ListcellCollectionViewCell
                cell.lblNew.text = MainTableArr[indexPath.item].name
                cell.statsLbl.text = MainTableArr[indexPath.item].status__c
                if(MainTableArr[indexPath.row].open_date__c == nil)
                {
                    cell.openDateLbl.text = "TBD"
                    cell.dueDateLbl.text = "TBD"
                }else
                {
                    cell.openDateLbl.text = "TBD"
                    cell.dueDateLbl.text = "TBD"
                }

                return cell
            }else if (selectedIndexMe == 1)
            {
                cvListing.register(UINib(nibName: "OpenCollectionViewcell", bundle: nil), forCellWithReuseIdentifier: "OpenCell")
                let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "OpenCell", for: indexPath) as! OpenCollectionViewcell
                
                if(self.MainTableArr[indexPath.row].status__c == "Closed"){
                    cell.nameLbl.text = MainTableArr[indexPath.row].name
                    cell.remainingDayslbl.text = MainTableArr[indexPath.row].day_remaining__c
                    cell.submissionLbl.text = "\(MainTableArr[indexPath.row].number_of_submitted_applications__c ?? 0)"
                    cell.changeRatioLbl.text = "\(MainTableArr[indexPath.row].progress__c ?? "")this week"
                }
                
                return cell
            }else if (selectedIndexMe == 2)
            {
                cvListing.register(UINib(nibName: "ReviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReviewCells")
                let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "ReviewCells", for: indexPath) as! ReviewCollectionViewCell
                
                if(self.MainTableArr[indexPath.row].status__c == "Closed")
                {
                    
                }
                
                return cell
            }else
            {
                cvListing.register(UINib(nibName: "AwardedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AwarededCell")
                let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "AwarededCell", for: indexPath) as! AwardedCollectionViewCell
                
                return cell
            }
            
            
        }else if collectionView == self.subCategoryCollectionView
        {
            subCategoryCollectionView.register(UINib(nibName: "CollectionViewScholarshipsCell", bundle: nil), forCellWithReuseIdentifier: "scholarship")
            let cells = subCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "scholarship", for: indexPath) as! CollectionViewScholarshipsCell
            cells.mainLbl.text = AccountsArr[indexPath.item] 
            return cells as CollectionViewScholarshipsCell

        }
        else
        {
            cvCategary.register(UINib(nibName: "Theme2CategaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Theme2CategaryCell")
            let cell = cvCategary.dequeueReusableCell(withReuseIdentifier: "Theme2CategaryCell", for: indexPath) as! Theme2CategaryCollectionViewCell
            cell.lblTitle.text = arrCategaries[indexPath.item].subtab_name__c
            cell.lblDot.layer.cornerRadius = cell.lblDot.layer.frame.height/2
            if SelectedIndex == indexPath.item {
                cell.lblDot.isHidden = false
            }else {
                cell.lblDot.isHidden = true
            }
            return cell
        }
    }
    
    @objc func connectedSmart(sender: UIButton){

        let vc = Theme1ProfileViewController(nibName: "Theme1ProfileViewController", bundle: nil)
//        vc.imageUrl = AccountsArr[sender.tag].account_logo_url__c
//        vc.sfdcStr = AccountsArr[sender.tag].sfid
//        vc.profileName = AccountsArr[sender.tag].name!
//        vc.total_applicants = "\(AccountsArr[sender.tag].total_applicants__c!)"
//        vc.new_applicants_this_week = "\(AccountsArr[sender.tag].new_applicants_this_week__c!)"
//        vc.total_live_scholarship = "\(AccountsArr[sender.tag].total_live_scholarship!)"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func openArr(){
        
        if(selectedIndexMe == 0)
        {
            AccountsArr.removeAll()
            if(self.arrCategaries[0].subtab_name__c == "Scholarships")
            {
                guard let arrOne = self.arrCategaries[0].table_headers[0].column_name__c else { return  }
                guard let arrTwo = self.arrCategaries[0].table_headers[1].column_name__c else { return  }
                guard let arrThree = self.arrCategaries[0].table_headers[2].column_name__c else { return }
                guard let arrFour = self.arrCategaries[0].table_headers[3].column_name__c else { return }
                
                self.AccountsArr.append(arrOne)
                self.AccountsArr.append(arrTwo)
                self.AccountsArr.append(arrThree)
                self.AccountsArr.append(arrFour)
            }
        }else if(selectedIndexMe == 1){
            AccountsArr.removeAll()
            if(self.arrCategaries[1].subtab_name__c == "Open")
            {
                guard let arrOne = self.arrCategaries[1].table_headers[0].column_name__c else { return  }
                guard let arrTwo = self.arrCategaries[1].table_headers[1].column_name__c else { return  }
                guard let arrThree = self.arrCategaries[1].table_headers[2].column_name__c else { return }
                guard let arrFour = self.arrCategaries[1].table_headers[3].column_name__c else { return }
                
                self.AccountsArr.append(arrOne)
                self.AccountsArr.append(arrTwo)
                self.AccountsArr.append(arrThree)
                self.AccountsArr.append(arrFour)
            }
        }else if(selectedIndexMe == 2){
            AccountsArr.removeAll()

            if(self.arrCategaries[2].subtab_name__c == "In Review")
            {
                guard let arrOne = self.arrCategaries[2].table_headers[0].column_name__c else { return  }
                guard let arrTwo = self.arrCategaries[2].table_headers[1].column_name__c else { return  }
                guard let arrThree = self.arrCategaries[2].table_headers[2].column_name__c else { return }
                guard let arrFour = self.arrCategaries[2].table_headers[3].column_name__c else { return }
                
                self.AccountsArr.append(arrOne)
                self.AccountsArr.append(arrTwo)
                self.AccountsArr.append(arrThree)
                self.AccountsArr.append(arrFour)
            }
        }else if(selectedIndexMe == 3){
            AccountsArr.removeAll()

            if(self.arrCategaries[3].subtab_name__c == "Awarded")
            {
                guard let arrOne = self.arrCategaries[3].table_headers[0].column_name__c else { return  }
                guard let arrTwo = self.arrCategaries[3].table_headers[1].column_name__c else { return  }
                guard let arrThree = self.arrCategaries[3].table_headers[2].column_name__c else { return }
                guard let arrFour = self.arrCategaries[3].table_headers[3].column_name__c else { return }
                
                self.AccountsArr.append(arrOne)
                self.AccountsArr.append(arrTwo)
                self.AccountsArr.append(arrThree)
                self.AccountsArr.append(arrFour)
            }
        }
        self.subCategoryCollectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvCategary {
            SelectedIndex = indexPath.item
            selectedIndexMe = indexPath.item
            openArr()
            self.cvCategary.reloadData()
        }else if collectionView == subCategoryCollectionView{
            SelectedIndex = indexPath.item
        }
        else if collectionView == cvListing{
            let vc = Theme6ListViewController(nibName: "Theme6ListViewController", bundle: nil)
            //vc.sfdcidStr = AccountsArr[indexPath.row].sfid
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
       
        self.cvListing.scrollToItem(at: [0], at: .top, animated: true)
        self.cvListing.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.cvListing {
            return CGSize(width: cvListing.frame.width - 8, height: 76)
        }else if collectionView == self.cvCategary {
            return CGSize(width: cvCategary.frame.width / 4, height: 75)
        }else {
            return CGSize(width: cvCategary.frame.width / 4, height: 75)
        }
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events Methods.
        
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//
extension NSAttributedString {
        internal convenience init?(html: String) {
            guard let data = html.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
                // not sure which is more reliable: String.Encoding.utf16 or String.Encoding.unicode
                return nil
            }
            guard let attributedString = try? NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
                return nil
            }
            self.init(attributedString: attributedString)
        }
}
