//
//  TNavigationViewController.swift
//  ShopHop
//
//  Created by  on 14/08/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class TNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureRecognized(_:))))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showMenu() {
        // Dismiss keyboard (optional)
        //
        view.endEditing(true)
       // frostedViewController.view.endEditing(true)
        // Present the view controller
        //
       // frostedViewController.presentMenuViewController()
    }


    func hideMenu() {
       // frostedViewController.hideMenuViewController()
    }
    
    // MARK: - Gesture recognizer
    @objc func panGestureRecognized(_ sender: UIPanGestureRecognizer?) {
        // Dismiss keyboard (optional)
        //
        view.endEditing(true)
       // frostedViewController.view.endEditing(true)
        // Present the view controller
        //
       // frostedViewController.panGestureRecognized(sender)
    }
}
