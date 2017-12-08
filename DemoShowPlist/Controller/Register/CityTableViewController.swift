//
//  CityTableViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 11/27/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.cities.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = DataService.shared.cities[indexPath.row].name
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            DataService.shared.selectedCity = DataService.shared.cities[indexPath.row]
            UserDefaults.standard.set((DataService.shared.cities[indexPath.row].name), forKey: "city")
        }
    }
}
