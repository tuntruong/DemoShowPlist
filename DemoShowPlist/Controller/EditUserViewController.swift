//
//  EditUserViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/4/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class EditUserViewController : UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityPickerView: UIPickerView! = UIPickerView()
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var data : User?
    var city : String?
    var dist : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = data?.name
        ageTextField.text = "\(data?.age ?? 0)"
        genderTextField.text = data?.gender
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return DataService.shared.cities.count
        }else{
           DataService.shared.selectedCity = DataService.shared.cities[pickerView.selectedRow(inComponent: 0)]
            return DataService.shared.districtsAtSelectedCity?.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return DataService.shared.cities[row].name
        }else{
            DataService.shared.selectedCity = DataService.shared.cities[pickerView.selectedRow(inComponent: 0)]
            return DataService.shared.districtsAtSelectedCity?[row].name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCity = pickerView.selectedRow(inComponent: 0)
        let selectedDistrict = pickerView.selectedRow(inComponent: 1)
        
        city  = DataService.shared.cities[selectedCity].name
        dist = DataService.shared.districtsAtSelectedCity?[selectedDistrict].name
        
        cityLabel.text = "City: \(city ?? "Hà Nội") \n  District: \(dist ?? "Ba Đình") "
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem , button == saveButton else {return}
        guard let age = Int16(ageTextField.text ?? "") else {return}
        
        data?.name = nameTextField.text
        data?.age = age
        data?.gender = genderTextField.text
        data?.city = city ?? data?.city
        data?.district = dist ?? data?.district
    }
}
