//
//  DiscreteViewController.swift
//  PazhgGusture
//
//  Created by Pazhg on 2/16/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit

class DiscreteViewController: UIViewController {

    @IBOutlet weak var textviewGesture: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gestureTapRecogniser(_ sender: UITapGestureRecognizer) {
        textviewGesture.text.append ("Tap Gesture -> Tap Require Touch \(sender.numberOfTouchesRequired), Number of touches: \(sender.numberOfTouches)\n")
    }
    @IBAction func gestureSwipeRight(_ sender: UISwipeGestureRecognizer) {
        textviewGesture.text.append("Gesture Swipe -> Right : Require Touch \(sender.numberOfTouchesRequired), Number of touches: \(sender.numberOfTouches)\n")
    }
    @IBAction func gestureSwipeLeft(_ sender: UISwipeGestureRecognizer) {
         textviewGesture.text.append("Gesture Swipe -> Left : Require Touch \(sender.numberOfTouchesRequired), Number of touches: \(sender.numberOfTouches)\n")
    }
    @IBAction func gestureSwipeUp(_ sender: UISwipeGestureRecognizer) {
         textviewGesture.text.append("Gesture Swipe -> Up : Require Touch \(sender.numberOfTouchesRequired), Number of touches: \(sender.numberOfTouches)\n")
    }

    @IBAction func gestureSwipeDown(_ sender: UISwipeGestureRecognizer) {
        textviewGesture.text.append("Gesture Swipe -> Down : Require Touch \(sender.numberOfTouchesRequired), Number of touches: \(sender.numberOfTouches)\n")
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
