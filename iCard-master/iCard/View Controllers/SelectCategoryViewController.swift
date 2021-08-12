//
//  SelectCategoryViewController.swift
//  iCard
//
//  Created by Pazhg on 3/22/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//
import UIKit
class SelectCategoryViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //Configure the cell
        
        cell.textLabel!.text = mainCategory [ indexPath.row].Title
        cell.detailTextLabel?.text = "0 items."
        if mainCategory [ indexPath.row].Checked == true {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        if indexPath.row == 0 {
            cell.detailTextLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Set the checkmark as selected category
        print(indexPath.row)
        if indexPath.row != 0 {
            let cell = tableView.cellForRow(at: indexPath)
            if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
                cell?.accessoryType = .none
                mainCategory [ indexPath.row].Checked = false
            } else {
                cell?.accessoryType = .checkmark
                mainCategory [ indexPath.row ].Checked = true
            }
        } // end of main if
       
        
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
