//
//  AgeViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/28/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
class AgeViewController : UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerView: UIPickerView!

    var ages = [Int](1...100)
    var ageToSend : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.selectRow(17, inComponent: 0, animated: false)

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        ageToSend = ages[row]
        return "\(ages[row]) ages"
    }
    
    @IBAction func saveData(_ sender: UIButton) {
        UserDefaults.standard.set(ageToSend, forKey: "age")
    }
}
