//
//  NameViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/2/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
class NameViewControlelr : UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func passNameTextField(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
    }
}
