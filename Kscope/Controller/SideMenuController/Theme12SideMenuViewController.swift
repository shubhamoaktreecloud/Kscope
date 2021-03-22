//
//  Theme12SideMenuViewController.swift
//  Social
//
//  Created by ""-ios on 23/01/20.
//  Copyright © 2020 ""-ios. All rights reserved.
//

import UIKit
protocol Theme12SlideMenuDelegate {
    func Theme12SlideMenuItemSelectedAtIndex(_ index : Int32)
}
class Theme12SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK:-
    //MARK:- Outlets
    
    @IBOutlet weak var tblSideMenu: UITableView!
    
    @IBOutlet weak var btnCloseMenu: UIButton!
    
    @IBOutlet weak var ConstraintTblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var ConstraintSafeArea: NSLayoutConstraint!
    
    //MARK:-
    //MARK:- Variables
    
    let arrSideMenu = ["Overview","Scholarships","Applicants","People","Logout"]
    var btnMenu : UIButton!
    var delegate : Theme12SlideMenuDelegate?
    
    //MARK:-
    //MARK:- UIView Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetUpObject()
    }
    
    //MARK:-
    //MARK:- SetUpObject Methods
    
    func SetUpObject() {
        if #available(iOS 11.0, *) {} else {
            ConstraintSafeArea.constant = UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    //MARK:-
    //MARK:-UITableView Delegate and DataSources
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        self.ConstraintTblHeight.constant = CGFloat(arrSideMenu.count * 50)
        
        return arrSideMenu.count
    }
                     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        self.tblSideMenu.register(UINib.init(nibName:"Theme12SideMenuTableCell", bundle: nil),forCellReuseIdentifier: "Theme12SideMenuCell")
        let cell = tblSideMenu.dequeueReusableCell(withIdentifier:"Theme12SideMenuCell", for: indexPath) as!Theme12SideMenuTableCell
        cell.lblTitle.text = arrSideMenu[indexPath.row]
        cell.selectionStyle = .none
        return cell
       }
                          
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if(indexPath.row == 0)
        {
            let vc = Theme1ListingViewController(nibName: "Theme1ListingViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if(indexPath.row == 1)
        {
            let vc = Theme2ListingViewController(nibName: "Theme2ListingViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if(indexPath.row == 2)
        {
            let vc = ApplicantController(nibName: "ApplicantController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if(indexPath.row == 3)
        {
            let vc = PeopleController(nibName: "PeopleController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }else if(indexPath.row == 4)
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK:-
    //MARK:- UIButton Clicked Events

    @IBAction func btnBack_Clicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnCloseMenu_Clicked(_ sender: UIButton) {
        btnMenu.tag = 0
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if sender == btnCloseMenu {
                index = -1
            }
            delegate?.Theme12SlideMenuItemSelectedAtIndex(index)
        }
        
        THelper.AnimateToClose(vc: self)
    }
}
