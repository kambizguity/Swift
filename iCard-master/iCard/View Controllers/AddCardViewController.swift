//
//  AddCardViewController.swift
//  iCard
//
//  Created by Pazhg on 3/23/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var pickerViewCategory: UIPickerView!
    @IBOutlet weak var textViewDetail: UITextView!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var buttonStore: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldTitle.delegate = self
        textViewDetail.delegate = self

        // Do any additional setup after loading the view.
        SetStyle(for: buttonStore)
        SetStyle(for: buttonReset)
        textViewDetail.layer.borderColor = UIColor.gray.cgColor
        textViewDetail.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldTitle.resignFirstResponder()
        textViewDetail.resignFirstResponder()
    }
    
    //MARK: PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainCategory.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mainCategory [ row ].Title
    }
    
    //MARK: ResignFirst Responder
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func FirstResponder()  {
        textViewDetail.resignFirstResponder()
        textFieldTitle.resignFirstResponder()
    }
    
    //MARK: BUTTONS
    @IBAction func buttonDone(_ sender: UIButton) {
        FirstResponder()
    }
    @IBAction func buttonStore(_ sender: UIButton) {
        FirstResponder()
    }
    @IBAction func buttonReset(_ sender: UIButton) {
        FirstResponder()
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
