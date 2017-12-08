//
//  HomeViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/1/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    @IBAction func menu(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "myNotifiKey"), object: nil , userInfo: ["message": true])
    }
}
