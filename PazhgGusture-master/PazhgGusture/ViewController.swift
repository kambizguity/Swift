//
//  ViewController.swift
//  PazhgGusture
//
//  Created by Pazhg on 2/16/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonDiscrete: UIButton!
    
    @IBOutlet weak var buttonContinues: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonDiscrete.layer.cornerRadius = 10
        buttonDiscrete.layer.borderWidth = 1
        buttonDiscrete.layer.borderColor = UIColor.green.cgColor
        
        buttonContinues.layer.cornerRadius = 10
        buttonContinues.layer.borderWidth = 1
        buttonContinues.layer.borderColor = UIColor.blue.cgColor
 
    }
    
    @IBAction func closeView ( segue : UIStoryboardSegue ) {
        
    }

    
    
}

