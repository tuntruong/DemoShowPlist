//
//  DistrictTableViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/27/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class DistrictTableViewController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = DataService.shared.districtsAtSelectedCity?.count else {return 0}
        return count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disCell", for: indexPath)
        cell.textLabel?.text = DataService.shared.districtsAtSelectedCity![indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set((DataService.shared.districtsAtSelectedCity![indexPath.row].name), forKey: "district")
    }
}


