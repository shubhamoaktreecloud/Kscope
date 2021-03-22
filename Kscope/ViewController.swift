//
//  ViewController.swift
//  Kscope
//
//  Created by Mac on 20/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let preferences = UserDefaults.standard
        
        let checkUser = preferences .value(forKey: "session")
        
        if (checkUser as? String == "loggedInUser")
        {
            let vc = Theme1ListingViewController(nibName: "Theme1ListingViewController", bundle: nil)
            preferences.set("viewcontroller", forKey: "checkcontroller")
            self.navigationController?.pushViewController(vc, animated: true)
        }else
        {
            let vc = Theme7SignInViewController(nibName: "Theme7SignInViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

