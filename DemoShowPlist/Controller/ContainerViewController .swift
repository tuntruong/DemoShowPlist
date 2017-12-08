//
//  ContainerViewController .swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/2/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class ContrainerViewController : UIViewController{
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false {
        didSet{
            if menuShowing{
                leadingConstraint.constant = 0
            } else {
                leadingConstraint.constant = -menuView.frame.width
            }
            UIView.animate(withDuration: 0.5, animations: self.view.layoutIfNeeded)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuShowing = false
        
        NotificationCenter.default.addObserver(self,selector: #selector(showMenu(notification:)),name: NSNotification.Name(rawValue: "myNotifiKey"),object: nil)
    }
    
    @objc func showMenu(notification: Notification){
        menuShowing = !menuShowing
    }
}
