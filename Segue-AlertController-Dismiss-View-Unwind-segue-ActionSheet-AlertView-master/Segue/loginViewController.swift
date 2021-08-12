//
//  loginViewController.swift
//  Segue
//
//  Created by Pazhg on 3/31/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class loginViewController: UIViewController, UITextFieldDelegate{
    //MARK: Outlets
    @IBOutlet weak var textfieldUsername: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    @IBOutlet weak var labelHint: UILabel!
    
     //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        labelHint.text = ""
    }
    
    //MARK: Dismiss Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textfieldPassword.resignFirstResponder()
        self.textfieldUsername.resignFirstResponder()
    }
    
    //MARK: Buttons
    @IBAction func buttonLogin(_ sender: UIButton) {
        funcResignFirstResponder()
        if !textfieldUsername.text!.isEmpty && !textfieldPassword.text!.isEmpty {
            labelHint.text  = ""
            funcShowAlert(with: textfieldUsername.text!, and: textfieldPassword.text!)
        } else {
            labelHint.text = "Please chack the value of username or password!"
        }
    }
    
    func funcShowAlert ( with username: String, and password : String ) {
        //Define AlertView
         let alert = UIAlertController.init(title: "Authentication Form", message: "", preferredStyle: UIAlertController.Style.alert)
        if username == "Admin" && password == "xyz"
        {
            alert.message = "Welcome to dashboard!"
            let actionLogin = UIAlertAction.init(title: "Login", style: UIAlertAction.Style.default) { (UIAlertAction) in
                print("Login - Successfuly")
            }
            alert.addAction(actionLogin)
        } else {
            alert.message = "Authentication is failed. Please check it again!"
        }
        let actionCancel = UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func buttonClear(_ sender: UIButton) {
        textfieldUsername.text = ""
        textfieldPassword.text = ""
        labelHint.text = ""
        
        funcResignFirstResponder()
    }

    //MARK: Functions:
    func funcResignFirstResponder () {
        textfieldUsername.resignFirstResponder()
        textfieldPassword.resignFirstResponder()
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
