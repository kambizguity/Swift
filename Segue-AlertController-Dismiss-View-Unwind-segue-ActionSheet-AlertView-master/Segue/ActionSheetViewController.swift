//
//  ActionSheetViewController.swift
//  Segue
//
//  Created by Pazhg on 3/31/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class ActionSheetViewController: UIViewController {

    enum AlertType {
        case Alert
        case ActionSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
}
    
    func ShowAlert (with type : AlertType)  {
        
        let alert : UIAlertController?
        
        if type == .ActionSheet
        {
            alert = UIAlertController.init(title: "ActionSheet", message: "please select an option", preferredStyle: UIAlertController.Style.actionSheet)
        } else
        {
            alert = UIAlertController.init(title: "Alert", message: "please select an option", preferredStyle: UIAlertController.Style.alert)
            
            alert?.addTextField(configurationHandler: { (textField: UITextField) in
                textField.placeholder = "Reciever Email"
            })

        }
        
        let actionReply = UIAlertAction.init(title: "Reply", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Reply")
        }
        var textProfile: String = ""
        let actionForward = UIAlertAction.init(title: "Forward", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Forward")
            textProfile = alert!.textFields! [0].text!
        }
        let actionSpam = UIAlertAction.init(title: "Spam", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
            print("Spam")
        }
        let actionCancel = UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel ) { (UIAlertAction) in
            print("Cancel")
        }
        alert!.addAction(actionReply)
        alert!.addAction(actionForward)
        alert!.addAction(actionSpam)
        alert!.addAction(actionCancel)
        self.present(alert!, animated: true) {
            print ("The UIAlertController has shown!")
        }
        print(textProfile)
    }
    
    @IBAction func buttonAlert(_ sender: UIButton) {
        ShowAlert(with: .Alert)
    }
    
    
    @IBAction func buttonActionSheet(_ sender: UIButton) {
        ShowAlert(with: .ActionSheet)
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
