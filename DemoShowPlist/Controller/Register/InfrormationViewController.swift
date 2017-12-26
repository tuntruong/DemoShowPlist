//
//  InfrormationViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/28/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
class InformationViewController : UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = UserDefaults.standard.object(forKey: "name") as? String else {return }
        guard let age = UserDefaults.standard.object(forKey: "age") as? Int16 else {return }
        guard let gender = UserDefaults.standard.object(forKey: "gender") as? String else {return }
        guard let city = UserDefaults.standard.object(forKey: "city") as? String else {return }
        guard let district = UserDefaults.standard.object(forKey: "district") as? String else {return }
        
            nameLabel.text = name
            ageLabel.text = "\(age)"
            genderLabel.text = gender
            cityLabel.text = city
            districtLabel.text = district
    }
    
    @IBAction func register(_ sender: Any) {
        save(name: nameLabel.text ?? "" , age: Int16(ageLabel.text ?? "") ?? 0, gender: genderLabel.text ?? "", city: cityLabel.text ?? "", district: districtLabel.text ?? "")
        navigationController?.popToRootViewController(animated: true)
    }
    
    func save(name: String , age: Int16 , gender: String , city: String , district: String) {
        let user = User(context: AppDelegate.shared.persistentContainer.viewContext)
        user.name = name
        user.age = age
        user.gender = gender
        user.city = city
        user.district = district
        AppDelegate.shared.saveContext()
    }
}
