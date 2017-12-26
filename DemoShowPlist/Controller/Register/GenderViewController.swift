//
//  GenderViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/28/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
class GenderViewController : UIViewController {
    @IBOutlet var genderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func radioButton(_ sender: UIButton) {
        genderButtons.forEach{$0.isSelected = false}
        sender.isSelected = true
        guard let gender = sender.currentTitle else {return}
        UserDefaults.standard.set(gender, forKey: "gender")
    }
    
    func getIndexOfGenderButton(btn: UIButton) -> Int? {
        for (index, item) in genderButtons.enumerated() {
            if item === btn {return index}
        }
        return nil
    }
}


