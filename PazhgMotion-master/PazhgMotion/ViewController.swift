//
//  ViewController.swift
//  PazhgMotion
//
//  Created by Pazhg on 2/10/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    @IBOutlet weak var labelXDimention: UILabel!
    @IBOutlet weak var labelYDimention: UILabel!
    @IBOutlet weak var labelZDimention: UILabel!
    
    @IBOutlet weak var labelGyroscopeX: UILabel!
    @IBOutlet weak var labelGyroscopeY: UILabel!
    @IBOutlet weak var labelGyroscopeZ: UILabel!

    @IBOutlet weak var labelHz: UILabel!
    
    @IBOutlet weak var sliderFrequency: UISlider!
    @IBOutlet weak var switchAccelerometerOutlet: UISwitch!
    @IBOutlet weak var switchGryroscopeOutlet: UISwitch!
    
    var motionManager : CMMotionManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderFrequency.setThumbImage(UIImage.init(named: "Arrow"), for: .normal)
        
        if motionManager?.isDeviceMotionAvailable == false {
            // TODO: - Alert to User that your device is not able to use Motion Device
        } else
        {
            motionManager = CMMotionManager.init()
        }
    }

    // MARK: - SWITCHES
    @IBAction func switchAccelerometer(_ sender: UISwitch) {
        if sender.isOn == false {
            if (motionManager?.isAccelerometerAvailable)! {
                motionManager?.stopAccelerometerUpdates()
                self.labelXDimention.text = "X Dimention: 0"
                self.labelYDimention.text = "Y Dimention: 0"
                self.labelZDimention.text = "Z Dimention: 0"
            }
            else {
                showAlertForUnavailableServices(in: "PazhgMotion", by: "The accelerometer service is not available in your device!")
                sender.setOn(false, animated: true)
            }
        } else {
            if (motionManager?.isAccelerometerAvailable)! {
                motionManager?.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (accelerometerData : CMAccelerometerData?, error : Error?) in
                    
                    let formatter = NumberFormatter()
                    formatter.minimumFractionDigits = 0
                    formatter.maximumFractionDigits = 0
                    
                    self.labelXDimention.text = "X Dimention: " + formatter.string(for: accelerometerData!.acceleration.x * 100)!
                    self.labelYDimention.text = "Y Dimention: " + formatter.string(for: accelerometerData!.acceleration.y * 100)!
                    self.labelZDimention.text = "Z Dimention: " + formatter.string(for: accelerometerData!.acceleration.z * 100)!
                })
            } else {
                sender.setOn(false, animated: true)
             }
         }
    }
    
    @IBAction func switchGyroscope(_ sender: UISwitch) {
        if sender.isOn == false {
            sliderFrequency.isEnabled = true
            motionManager?.stopGyroUpdates()
        } else {
            if motionManager!.isGyroAvailable {
                sliderFrequency.isEnabled = false
                let tempFrequency = sliderFrequency.value
                motionManager?.gyroUpdateInterval = TimeInterval( 1.0 / tempFrequency)
                motionManager?.startGyroUpdates(to: .main, withHandler: { ( GyroData : CMGyroData?, error : Error?) in
                    guard GyroData != nil else { return }
                    
                        let formatter = NumberFormatter.init()
                        formatter.maximumFractionDigits = 0
                        formatter.minimumFractionDigits = 0

                    self.labelGyroscopeX.text = "X Axes: \(String(describing: formatter.string(from:  NSNumber(value: GyroData!.rotationRate.x * 100.0) )))"
                    self.labelGyroscopeY.text = "Y Axes: \(String(describing: formatter.string(from:  NSNumber(value: GyroData!.rotationRate.y * 100.0) )))"
                    self.labelGyroscopeZ.text = "Z Axes: \(String(describing: formatter.string(from:  NSNumber(value: GyroData!.rotationRate.z * 100.0) )))"
                })
            } else {
                showAlertForUnavailableServices(in: "PazhgMotion", by: "The Gyroscope service is not available in your device!")
                sender.setOn(false, animated: true)
            }
            
        }
    }
    
    
    func showAlertForUnavailableServices ( in appName : String , by comment : String ) {
        let alert = UIAlertController.init(title: appName, message: comment, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true
            , completion:  nil)
    }
    // MARK: - Transform Switch
//    func TransformSwitch ( switch sender : UISwitch ) {
//        sender.transform = CGAffineTransform(rotationAngle: .pi / -2 )
//    }
    
    //MARK: - Slider
    @IBAction func sliderFrequency(_ sender: UISlider) {
        
        let tempFrequency  : Int = Int(sliderFrequency.value)
        labelHz.text = "Frequency: \(tempFrequency) Hz"
        let temp = Int ( sender.value )
        
        sender.setValue( Float ( temp ) , animated: true)
        
    }
    
}

