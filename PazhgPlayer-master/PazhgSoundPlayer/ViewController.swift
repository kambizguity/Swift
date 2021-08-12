//
//  ViewController.swift
//  PazhgSoundPlayer
//
//  Created by Pazhg on 2/15/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var labelRepeat: UILabel!
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelVolume: UILabel!
    @IBOutlet weak var labelAudioFile: UILabel!
    
    @IBOutlet weak var segmentAudioFile: UISegmentedControl!
    
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var sliderAudioSetting: UISlider!
    
    @IBOutlet weak var progressDuration: UIProgressView!
    
    @IBOutlet weak var switchRepeat: UISwitch!
    
    @IBOutlet weak var textviewLog: UITextView!
    @IBOutlet weak var stepperSpeed: UIStepper!
    
    
    //MARK: - Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelSpeed.text = "Speed: Normal(1.0x)"
        
        
//        let categoryOption : AVAudioSession.CategoryOptions = AVAudioSession.CategoryOptions.init(arrayLiteral: [AVAudioSession.CategoryOptions.allowBluetooth])
//
        guard audioSession != nil else {
            textview(change: "AudioSession is not available!")
            return
        }
        textview(change: "Play background is available.")
        textview(change: "Another app currently playing audio: \( audioSession!.isOtherAudioPlaying)")
        textview(change: "another application is playing audio: \( audioSession!.secondaryAudioShouldBeSilencedHint)")
        
        
        textview(change: "Output:\(audioSession!.currentRoute.outputs)")
        textview(change: "Input :\(audioSession!.currentRoute.inputs)")
        textview(change: "Input Available: \(audioSession!.isInputAvailable)")
        textview(change: "Working with AudioChannels\nInput number of channels: \(audioSession!.inputNumberOfChannels)")
        textview(change: "Max of number of channels:\(audioSession!.maximumInputNumberOfChannels)")
        textview(change: "Output number of channels: \(audioSession!.outputNumberOfChannels)")
        
        textview(change: "Maximum of number of Channels: \(audioSession!.maximumOutputNumberOfChannels)")
        
    }
    
    
    
    //MARK- : TextViewAppend
    func textview ( change with : String ) {
        textviewLog.text.append( "\(with)\n")
    }
    
    //MARK- :Segmented Controls
    @IBAction func segmentFiles(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        let string : String = sender.titleForSegment(at: index)!
        
        labelAudioFile.text = "Audio File: \(string)"
        textview(change: "Audio Files: \(string)")
    }
    
    //MARK: - Switch
    @IBAction func switchRepeat(_ sender: UISwitch) {
        if switchRepeat.isOn {
            textview(change: "Repeat: Yes")
        } else {
            textview(change: "Repeat: No")
        }
    }
    
    //MARK: - Sliders
    @IBAction func sliderVolume(_ sender: UISlider) {
        
        let volume : Int = Int (sender.value * 100 )
        
        labelVolume.text = "Volume: \(volume))%"
        
        
        textview(change: "Current Volume: \(volume)")
        
    }
    @IBAction func sliderAudioSetting(_ sender: UISlider) {
        if sender.value > 0.66 {
            sender.value = 1
        } else if sender.value < 0.33 {
            sender.value = 0
        } else
        {
            sender.value = 0.5
        }
        textview(change: "Setting has changed!")
    }
    
    //MARK: - Stepper
    @IBAction func stepperSpeed(_ sender: UIStepper) {
        
        var tempString : String?
        let currentValue : Int = Int ( sender.value )
        
        switch currentValue {
        case 0 :
            tempString = "Very Slow (0.3x)"
        case 1 :
             tempString = "Slow (0.5x)"
        case 2 :
             tempString = "Normal (1.0x)"
        case 3 :
             tempString = "Fast (0.3x)"
        default:
             tempString = "Very Fast (0.3x)"
        }
        labelSpeed.text = "Speed: \(tempString!)"
        textview(change: "Speed: \(tempString!)")
    }
    //MARK: - Buttons
    @IBAction func buttonPrevious(_ sender: UIButton) {
        textview(change: "Previous")
    }
    
    @IBAction func buttonPlayPause(_ sender: UIButton) {
        textview(change: "Pause/Play")

    }
    
    @IBAction func buttonStop(_ sender: UIButton) {
        textview(change: "Stop")

    }
    
    @IBAction func buttonForward(_ sender: UIButton) {
        textview(change: "Forward")

    }
    
    @IBAction func buttonBackward(_ sender: UIButton) {
        textview(change: "Backward")

    }
    
    @IBAction func buttonNext(_ sender: UIButton) {
        textview(change: "Next")
    }
}

