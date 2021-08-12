//
//  MainViewController.swift
//  Segue
//
//  Created by Pazhg on 3/30/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    //MARK: Outlets
    @IBOutlet weak var textFieldName: UITextField!
    
    //MARK: Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textFieldName.becomeFirstResponder()
    }
    //MARK: Dismiss Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldName.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    // MARK: Buttons
    @IBAction func buttonSend(_ sender: UIButton) {
        print(textFieldName.text!)
    }
    
    @IBAction func buttonClear(_ sender: UIButton) {
        textFieldName.text = ""
        textFieldName.resignFirstResponder()
    }
    
    @IBAction func switchONOFF(_ sender: UISwitch) {
        textFieldName.resignFirstResponder()
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segue"{
            let segue  = segue.destination as! SecondViewController
            segue.string = textFieldName.text!
        }  else if segue.identifier == "segueBye" {
            let segue = segue.destination as! ByeViewController
            segue.string = textFieldName.text!
        }
    }
    //MARK: Unwind Segue
    @IBAction  func close ( segue: UIStoryboardSegue) { // Unwind Segue
    }
    
//
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//
//        let segue: UIStoryboardSegue = UIStoryboardSegue.init(identifier: identifier, source: self., destination: SecondViewController.init())
//
//
//    }
//

}
