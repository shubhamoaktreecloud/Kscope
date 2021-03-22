//
//  Theme2ListingViewController.swift
//  Prokit
//
//  Created by ""-ios on 16/11/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit
import ProgressHUD

class ApplicantController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK:-
    //MARK:- Outlets
    
    @IBOutlet weak var cvCategary: UICollectionView!
    @IBOutlet weak var cvListing: UICollectionView!
    @IBOutlet weak var ContraintSafeArea: NSLayoutConstraint!
    
    //MARK:-
    //MARK:- Variables.
    var arrCategaries = [applicantsModel]()
    var AccountsArr = [String]()

    var arrImg = ["Theme2List1","Theme2List2","Theme2List3","Theme2List1","Theme2List2","Theme2List3"]
    var arrTitle = [applicantsAccountModels]()
    var arrType = ["New","Popular","New","Popular","New","Popular"]
    var SelectedIndex = Int()
    
    //MARK:-
    //MARK:- UIView Life Cycles.
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        SetUpObject()
        getServiceCall()
    }
      
    func getServiceCall(){
        let preferences = UserDefaults.standard
        
        let currentsfid = preferences.value(forKey: "current_sfid")
        
        let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts/\(currentsfid!)/applicants")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request0016s000005DnR2AAK
        var request = URLRequest(url: requestUrl)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let currentToken = preferences.value(forKey: "token")
        request.setValue((currentToken as! String), forHTTPHeaderField: "Authorization")
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
            if let jsonPetitions = try? decoder.decode(ApplicantJsonObject.self, from: data!) {
             
                self.arrCategaries = jsonPetitions.persona_branding.sub_tabs.Applicant
                self.arrTitle = jsonPetitions.applicants
                self.AccountsArr.removeAll()
                if(self.arrCategaries[0].subtab_name__c == "Applicant")
                {
                    guard let arrOne = self.arrCategaries[0].table_headers[0].column_name__c else { return  }
                    guard let arrTwo = self.arrCategaries[0].table_headers[1].column_name__c else { return  }
                    guard let arrThree = self.arrCategaries[0].table_headers[2].column_name__c else { return }
                    guard let arrFour = self.arrCategaries[0].table_headers[3].column_name__c else { return }
                    guard let arrFive = self.arrCategaries[0].table_headers[4].column_name__c else { return }
                    guard let arrSix = self.arrCategaries[0].table_headers[5].column_name__c else { return }
                    guard let arrSeven = self.arrCategaries[0].table_headers[6].column_name__c else { return }
                    self.AccountsArr.append(arrOne)
                    self.AccountsArr.append(arrTwo)
                    self.AccountsArr.append(arrThree)
                    self.AccountsArr.append(arrFour)
                    self.AccountsArr.append(arrFive)
                    self.AccountsArr.append(arrSix)
                    self.AccountsArr.append(arrSeven)
                }
            }
            DispatchQueue.main.async() {
            ProgressHUD.dismiss()
            self.cvListing.reloadData()
            self.cvCategary.reloadData()
            //self.subCategoryCollectionView.reloadData()
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
        if collectionView == self.cvListing {
            return self.arrTitle.count
        }else if collectionView == self.cvCategary {
            return self.AccountsArr.count
        }else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cvListing {
            cvListing.register(UINib(nibName: "ApplicantListcellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Theme2ListingCell")
            let cell = cvListing.dequeueReusableCell(withReuseIdentifier: "Theme2ListingCell", for: indexPath) as! ApplicantListcellCollectionViewCell
            cell.lblTitle.text = "\(arrTitle[indexPath.row].first_name__c ?? "") \(arrTitle[indexPath.row].last_name__c ?? "")"
            cell.appnameLbl.text = "\(arrTitle[indexPath.row].name ?? "")"
            cell.genderLbl.text = "\(arrTitle[indexPath.row].gender__c ?? "")"
            if indexPath.item % 2 == 0 {
//                cell.lblNew.isHidden = false
//                cell.lblPopular.isHidden = true
            }else {
//                cell.lblNew.isHidden = true
//                cell.lblPopular.isHidden = false
            }
//            cell.imgProfile.image = UIImage(named: arrImg[indexPath.item])
//            THelper.setShadowWithColor(view:cell.vwDetail, Color: COMMON_SHADOW_COLOR)
//            THelper.ListAnimation(view: cell)
            return cell
        }else {
            cvCategary.register(UINib(nibName: "ApplicantCategaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Theme2CategaryCell")
            let cell = cvCategary.dequeueReusableCell(withReuseIdentifier: "Theme2CategaryCell", for: indexPath) as! ApplicantCategaryCollectionViewCell
            cell.lblTitle.text = AccountsArr[indexPath.item]
            cell.lblDot.layer.cornerRadius = cell.lblDot.layer.frame.height/2
            if SelectedIndex == indexPath.item {
                cell.lblDot.isHidden = false
            }else {
                cell.lblDot.isHidden = true
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvCategary {
            SelectedIndex = indexPath.item
            self.cvCategary.reloadData()
        }
        self.cvListing.scrollToItem(at: [0], at: .top, animated: true)
        self.cvListing.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.cvListing {
            return CGSize(width: cvListing.frame.width - 8, height: 60)
        }else if collectionView == self.cvCategary {
            return CGSize(width: cvCategary.frame.width / 4, height: 60)
        }else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events Methods.
        
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

