//
//  HomeViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/1/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    @IBOutlet weak var hideMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideMenu.isHidden = true
    }
    @IBAction func menu(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "myNotifiKey"), object: nil , userInfo: ["message": true])
        hideMenu.isHidden = false
    }
    @IBAction func hideMenu(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "myNotifiKey"), object: nil , userInfo: ["message": true])
        hideMenu.isHidden = true
    }
}
