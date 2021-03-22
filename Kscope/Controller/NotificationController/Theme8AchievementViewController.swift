//
//  Theme8AchievementViewController.swift
//  Prokit
//
//  Created by ""-ios on 05/12/19.
//  Copyright © 2019 ""-ios. All rights reserved.
//

import UIKit

struct notificationsModel : Codable{
    
    var notifications: [Notifications]
}

struct Notifications : Codable{
    var id: Int?
    var sfid: String?
    var name: String?
    var createddate: String?
    var view_status__c: String?
    var notification_text__c: String?
    var notification_description__c: String?
//    var notification_logo_url__c: String?
    var notification_start_date__c: String?
    var notification_expiration_date__c: String?
    var related_object_name__c: String?
//    var related_record_id__c: String?
}

class Theme8AchievementViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:-
    //MARK:- Outlets
    
    var NotificationArr = [Notifications]()
    @IBOutlet weak var cvCategoires: UICollectionView!
    @IBOutlet weak var tblAchievements: UITableView!
    
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    //MARK:-
    //MARK:- Variables.
    
    var arrCategoires = ["Read","Unread"]
    var arrBadgeName = ["Quick Learner","Master Mind!","Super Learner","The Achiever","Locked Badge","Locked Badge","Locked Badge"]
    var arrBadgeComplete = ["Completed 1 Cource","Got 1st price on LeaderBoard","Complete more than 5 Cources","Logged in everyday fir a month","Unlock to see detail","Unlock to see detail","Unlock to see detail"]
    var arrBadgeImg = ["Theme8icoPolytics","Theme8icoMedals","Theme8icoAwards","Theme8icoSports","Theme8icoLock","Theme8icoLock","Theme8icoLock"]
    var arrBadgeImgTint = ["000000","000000","000000","000000","FFFFFF","FFFFFF","FFFFFF"]
    var arrBadgeBackColor = ["0433FF","34C759","FF85FF","FF730B","AAAAAA","AAAAAA","AAAAAA"]
    
    var arrLeaderName = ["Alice Smith","Hennah Trabn","Louisa MacGee","Walter James","Nia Scott","Hennah Tran"]
    var arrLeaderImg = ["img1","img3","img4","img7","img5","img10"]
    var arrLeaderPoint = ["132819 Point","132921 Point","132819 Point","142819 Point","132987 Point","1456819 Point"]
    var arrLeaderCount = ["1","2","3","4","5","6"]

    var selectedCatIndex = Int()
    
    //MARK:-
    //MARK:- UIView Life Cycles.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetUpObject()
        
        getServiceCall()
    }
    
    func getServiceCall(){
        let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/notifications")
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

            if let jsonPetitions = try? decoder.decode(notificationsModel.self, from: data!) {
                self.NotificationArr = jsonPetitions.notifications
                }
            print(self.NotificationArr)
            DispatchQueue.main.async() {
            self.tblAchievements.reloadData()
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
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        
        selectedCatIndex = 0
    }
    
 
    //MARK:-
    //MARK:- UICollectionView Delegate and DataSource.
             
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
    }
                           
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return arrCategoires.count
    }
                
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cvCategoires.register(UINib(nibName: "Theme8CateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LearnerCatCell")
        let cell = cvCategoires.dequeueReusableCell(withReuseIdentifier: "LearnerCatCell", for: indexPath) as! Theme8CateCollectionViewCell
        cell.lblTitle.text = arrCategoires[indexPath.item]
        if selectedCatIndex == indexPath.item {
            cell.lblLine.isHidden = false
            cell.lblLine.alpha = 1.0
        }else {
            cell.lblLine.isHidden = true
            cell.lblLine.alpha = 0.0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCatIndex = indexPath.item
        self.cvCategoires.reloadData()
        self.tblAchievements.reloadData()
    }
                        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = "\(arrCategoires[indexPath.item])"
        label.sizeToFit()
        return CGSize(width: label.frame.width + 40, height: self.cvCategoires.frame.height)
//        return CGSize(width: (self.cvCategoires.frame.width / 3) - 8, height: self.cvCategoires.frame.height)
    }
    
    
    //MARK:-
    //MARK:- UITableView Delegates and DataSources FFD479
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedCatIndex == 0 {
            return NotificationArr.count
        }else {
            return arrLeaderName.count
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if selectedCatIndex == 0 {
            self.tblAchievements.register(UINib.init(nibName: "Theme8BadgesTableViewCell", bundle: nil), forCellReuseIdentifier: "LearnerBadgeCell")
            let cell = tblAchievements.dequeueReusableCell(withIdentifier: "LearnerBadgeCell", for: indexPath) as! Theme8BadgesTableViewCell
            cell.lblTitle.text = NotificationArr[indexPath.row].notification_text__c
            cell.lblSubTitle.text = NotificationArr[indexPath.row].notification_description__c
//            cell.imgIcon.image = UIImage(named: arrBadgeImg[indexPath.row])
           // cell.imgIcon.tintColor = UIColor.init(hexString: arrBadgeImgTint[indexPath.row])
           // cell.vwImageBackGround.backgroundColor = UIColor.init(hexString: arrBadgeBackColor[indexPath.row])
            cell.vwImageBackGround.layer.cornerRadius = cell.vwImageBackGround.layer.frame.height / 2
            cell.selectionStyle = .none
          //  THelper.ListAnimation(view: cell)
            return cell
        }else {
            self.tblAchievements.register(UINib.init(nibName: "Theme8LeaderBoardTableViewCell", bundle: nil), forCellReuseIdentifier: "LearnerLeaderBoardCell")
            let cell = tblAchievements.dequeueReusableCell(withIdentifier: "LearnerLeaderBoardCell", for: indexPath) as! Theme8LeaderBoardTableViewCell
//            cell.lblTitle.text = arrLeaderName[indexPath.row]
//            cell.lblSubTilte.text = arrLeaderPoint[indexPath.row]
//            cell.imgProfile.image = UIImage(named: arrLeaderImg[indexPath.row])
//            cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height / 2
//            cell.lblCount.text = arrLeaderCount[indexPath.row]
         //   cell.vwCount.layer.cornerRadius = cell.vwCount.frame.height / 2
            if indexPath.row == 0 {
               // cell.vwMain.backgroundColor = UIColor.init(hexString: "FFEAA8")
               // cell.lblCount.textColor = UIColor.white
              //  cell.vwCount.backgroundColor = UIColor.init(hexString: "FFD479")
            }else if indexPath.row == 1 || indexPath.row == 2 {
                cell.vwMain.backgroundColor = UIColor.groupTableViewBackground
               // cell.lblCount.textColor = UIColor.init(hexString: "FFD479")
              //  cell.vwCount.backgroundColor = UIColor.white
               // cell.vwCount.layer.borderColor = UIColor.init(hexString: "FFD479").cgColor
               // cell.vwCount.layer.borderWidth = 1
            }else {
                cell.vwMain.backgroundColor = UIColor.groupTableViewBackground
               // cell.lblCount.textColor = UIColor.init(hexString: "AAAAAA")
               // cell.vwCount.backgroundColor = UIColor.white
               // cell.vwCount.layer.borderColor = UIColor.init(hexString: "AAAAAA").cgColor
               // cell.vwCount.layer.borderWidth = 1
            }
           // THelper.ListAnimation(view: cell)
            cell.selectionStyle = .none
            return cell
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
    }
               
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 80
        
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events
     
    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
