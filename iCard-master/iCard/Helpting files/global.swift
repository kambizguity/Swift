//
//  global.swift
//  iCard
//
//  Created by Pazhg on 3/22/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import Foundation
import UIKit

// Define Global variables and contents

enum repeatPlay {
    case repeatNo
    case repeatNormal
    case repeatReverse
}

var mainCategory : [(Title: String, Checked: Bool)] = [( "None", false) , ("English",false), ("French", false), ("تاریخ معاصر", false) , ("ملت عشق", false )]

//MARK: Functions

func SetStyle (for button : UIButton) {
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.titleLabel?.textColor = UIColor.black
    button.tintColor = UIColor.black
}
