//
//  UserListViewController.swift
//  DemoShowPlist
//
//  Created by Cuong15tr on 12/1/17.
//  Copyright © 2017 Cuong15tr. All rights reserved.
//

import UIKit
import os.log

class UserListTableViewController : UITableViewController {
    
    var userToShow : [User] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        do {
            userToShow = try AppDelegate.shared.persistentContainer.viewContext.fetch(User.fetchRequest()) as! [User]
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    // TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userToShow.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserListCell
        cell?.nameLabel.text = userToShow[indexPath.row].name
        cell?.ageLabel.text = "\(userToShow[indexPath.row].age)"
        cell?.genderLabel.text = userToShow[indexPath.row].gender
        cell?.cityLabel.text = userToShow[indexPath.row].city
        cell?.districtLabel.text = userToShow[indexPath.row].district
        return cell!
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! EditUserViewController
        destination.data = userToShow[(tableView.indexPathForSelectedRow?.row)!]
    }
    
    @IBAction func unwind(segue : UIStoryboardSegue) {
        if let svc = segue.source as? EditUserViewController{
            if let data = svc.data, let index = tableView.indexPathForSelectedRow?.row {
                userToShow[index] = data
                do {
                    try AppDelegate.shared.persistentContainer.viewContext.save()
                } catch let error as NSError {
                    print("Error While Deleting Note: \(error.userInfo)")
                }
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            AppDelegate.shared.persistentContainer.viewContext.delete(userToShow[indexPath.row])
            do {
                try AppDelegate.shared.persistentContainer.viewContext.save()
            } catch let error as NSError {
                print("Error While Deleting Note: \(error.userInfo)")
            }
            userToShow.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
