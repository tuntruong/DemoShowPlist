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
    
    var isMenuShowing = false {
        didSet{
            if isMenuShowing{
                leadingConstraint.constant = 0
            } else {
                leadingConstraint.constant = -menuView.frame.width
            }
            UIView.animate(withDuration: 0.5, animations: self.view.layoutIfNeeded)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,selector: #selector(showMenu(notification:)),name: NSNotification.Name(rawValue: "myNotifiKey"),object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isMenuShowing = false

    }
    
    @objc func showMenu(notification: Notification){
        isMenuShowing = !isMenuShowing
    }
}
