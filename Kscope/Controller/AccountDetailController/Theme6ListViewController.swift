//
//  Theme6ListViewController.swift
//  Prokit
//
//  Created by ""-  on 17/12/19.
//  Copyright © 2019 "". All rights reserved.
//

import UIKit
import ProgressHUD

struct TaskResponseModel: Codable  {
    let tasks: [Task]
}

struct Task : Codable {
    var id : Int
    var priority__c : String?
    var subject__c : String?
    var description__c : String?
    var status__c : String?
}

class Theme6ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    var sfdcidStr = ""
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var cvHotelList: UICollectionView!
    
    var TaskArr = [Task]()
    let arrHotelName = ["Chillax Heritage"]
    let arrHotelAddress = ["Santosa Road | 4.5 KM from center"]
    let arrHotalImage = ["theme6_ic_hotel1"]
    let arrHotelRatting = [4.0]
    let arrHotelReviews = ["3450 reviews"]
    let arrHotelPrice = ["US $399"]
    @IBOutlet var taskCountLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpObject()
        getServiceCall()
        
        taskCountLbl.text = "Tasks(0)"
        ProgressHUD.show("Loading...")
    }
    
    func getServiceCall(){
        let url = URL(string: "https://digital-dev-api.herokuapp.com/api/v1/clients/accounts/\(sfdcidStr)/tasks")
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

            if let jsonPetitions = try? decoder.decode(TaskResponseModel.self, from: data!) {
                self.TaskArr = jsonPetitions.tasks
                }
            print(self.TaskArr)
            DispatchQueue.main.async() {
            self.taskCountLbl.text = "Tasks(\(self.TaskArr.count))"
            self.cvHotelList.reloadData()
            ProgressHUD.dismiss()
            }
            
        }
        task.resume()
    }
    
    //MARK:-
    //MARK:- SetUpObject Methods
         
    func SetUpObject() {
        if #available(iOS 11.0, *) {} else {
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
        
        btnBack.layer.cornerRadius = 10
    }
    
    //MARK: -
    //MARK: - UICollectionView Delegate & DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TaskArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cvHotelList.register(UINib(nibName: "Theme6ListCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Theme6ListCell")
        let cell = cvHotelList.dequeueReusableCell(withReuseIdentifier: "Theme6ListCell", for: indexPath) as! Theme6ListCollectionCell
        
        cell.lblAddress.text = TaskArr[indexPath.item].subject__c
        cell.lblPrice.text = TaskArr[indexPath.item].description__c
        cell.bgView.layer.cornerRadius = 10.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: cvHotelList.frame.width, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    @IBAction func btnBack_Clicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
