//
//  ViewController.swift
//  AttributeString
//
//  Created by Pazhg on 12/16/1397 AP.
//  Copyright © 1397 Pazhg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var textfieldGivenName: UITextField!
    @IBOutlet weak var textfieldFamilyName: UITextField!
    
    @IBOutlet weak var switchItalic: UISwitch!
    
    @IBOutlet weak var buttonShow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // MARK: First Label Attributes
        let dictionaryAttributeString : [ NSAttributedString.Key : Any ] = [NSAttributedString.Key.backgroundColor: UIColor.red]
        
        let attributeString : NSAttributedString = NSAttributedString.init(string: "This is my first label with standard attributes!", attributes: dictionaryAttributeString )
        // Assign attributeString to labelFirst
        self.labelFirst.attributedText = attributeString

        // MARK: Second Label Atributes ( MutableAttributes )
        let str : String = "This is my second label with standard mutable attributes!"
        let secondAttributeString : NSMutableAttributedString = NSMutableAttributedString.init(string: str)
        
        // NSRange gives us two parameters : Length & Location ;)
        // NSMakeRange generate a NSRange
        // This type of assigning parameters to NSRange is static
        let range : NSRange = NSMakeRange( 0, "This is my second label".count )
        
        let attribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor : UIColor.red]
        secondAttributeString.addAttributes(attribute, range: range)
        
        
        //Assign attributes to labelSecond
        self.labelSecond.attributedText = secondAttributeString as NSAttributedString
    
        buttonShow.layer.cornerRadius = 10.0
        
        textfieldGivenName.placeholder = "John"
        textfieldFamilyName.placeholder = "Smith"
        
        labelResult.text = ""
    }

    @IBAction func buttonShow(_ sender: UIButton) {
        //Dismiss Keyboard
        textfieldFamilyName.resignFirstResponder()
        textfieldGivenName.resignFirstResponder()
        
        if let given =  self.textfieldGivenName.text , !given.isEmpty, let family = self.textfieldFamilyName.text, !family.isEmpty {

            let currentString = "\(given) \(family)"
            
            //Set Attributes for GivenName
            let attributes : NSMutableAttributedString = NSMutableAttributedString.init(string: currentString)
            
            // Define an attribute for Given Name
            let givenAttribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor:UIColor.darkGray]
            // Length of GivenName
            var tempRange : NSRange = NSMakeRange(0, given.count )
            // Set attribute for GivenName
            attributes.addAttributes(givenAttribute, range: tempRange)
            
            
            //Set Attributes for Family
            // Define an attribute for Family
            let familyAttribute : [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor : UIColor.gray]
            // Lenth of Family
            tempRange = NSMakeRange(given.count , family.count + 1)
            // Set an attribute for Family
            attributes.addAttributes(familyAttribute, range: tempRange)
            
            
            //Set Font for labelResult attribute
            //Checking for Italic
            var font : UIFont
            
            if switchItalic.isOn {
                font = UIFont.init(name: "Avenir-Light", size: self.labelResult.font.pointSize)!
                
            } else {
                font = UIFont.init(name: "Avenir-Medium", size: self.labelResult.font.pointSize)!
                
            }
            //Set values or parameters directly
            attributes.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange.init(location: 0, length: currentString.count))

            labelResult.attributedText = attributes
            labelResult.text = currentString
            
        } else {
            labelResult.text = ""
        }
    }
    
    
    // MARK: Dismiss Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfieldFamilyName.resignFirstResponder()
        textfieldGivenName.resignFirstResponder()
    }
    
    
}

