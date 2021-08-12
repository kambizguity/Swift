//
//  ByeViewController.swift
//  Segue
//
//  Created by Pazhg on 3/31/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class ByeViewController: UIViewController {
    var string : String?
    @IBOutlet weak var labelBye: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.labelBye.text = "Swedish: Hey doa \(string!)"
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
