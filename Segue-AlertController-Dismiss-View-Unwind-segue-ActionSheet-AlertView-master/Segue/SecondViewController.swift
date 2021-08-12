//
//  SecondViewController.swift
//  Segue
//
//  Created by Pazhg on 3/30/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController  {

    @IBOutlet weak var labelName: UILabel!
    var string : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelName.text = "Hello \(string!)"
    }
    
  
    @IBAction func buttonClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
