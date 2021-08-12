//
//  CardViewController.swift
//  iCard
//  Created by Pazhg on 3/21/1398 AP.
//  Copyright © 1398 Pazhg. All rights reserved.
//
import UIKit

class CardViewController: UIViewController {
    //MARK: Variables
    var bFavorite : Bool = false
    var bPlayCard : Bool = false
    var bSpeedHidden : Bool = true
    var repeatStatus : repeatPlay = .repeatNo
    
    //MARK: Outlets
    @IBOutlet weak var labelSpeed: UILabel!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var labelCardTitle: UILabel!
    
    @IBOutlet weak var buttonPlayPause: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    @IBOutlet weak var buttonRepeat: UIButton!
    
    @IBOutlet weak var sliderSpeed: UISlider!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var textviewCardDetail: UITextView!
    
    //MARK:  Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pageControl.numberOfPages = 8
        pageControl.currentPage = 0
        
        SetStyle(for: buttonPrevious)
        SetStyle(for: buttonNext)
        
        SetStatus(for: buttonPrevious, false)
        
        labelCounter.text = "\(pageControl.currentPage + 1) of \(pageControl.numberOfPages)"
        
        SpeedStatus(set: bSpeedHidden)
    }
    
    // MARK: Dismiss View Controller
    @IBAction func dismissViewController ( segue : UIStoryboardSegue ) {
    }
    
    //MARK: - Buttons
    @IBAction func buttonNext(_ sender: Any) {
        if pageControl.currentPage != pageControl.numberOfPages - 1 {
            pageControl.currentPage += 1
            if pageControl.currentPage == pageControl.numberOfPages - 1 {
                SetStatus(for: buttonNext, false)
            }
           if buttonPrevious.isEnabled == false {
                SetStatus(for: buttonPrevious, true)
            }
            //TODO:  Statement to load next data
        }
        labelCounter.text = "\(pageControl.currentPage + 1) of \(pageControl.numberOfPages)"
    }
    
    @IBAction func buttonPrevious(_ sender: Any) {
        if pageControl.currentPage  != 0 {
            pageControl.currentPage -= 1
            if pageControl.currentPage == 0 {
                SetStatus(for: buttonPrevious, false)
            }
            if buttonNext.isEnabled == false {
                SetStatus(for: buttonNext, true)
            }
            //TODO: -  // Statement to load previous data
        }
        labelCounter.text = "\(pageControl.currentPage + 1) of \(pageControl.numberOfPages)"
    }
   
    @IBAction func buttonFavorite(_ sender: UIButton) {
        if !bFavorite {
            let image : UIImage = UIImage.init(named: "redHeart")!
            sender.setBackgroundImage( image, for: UIControl.State.normal)
            bFavorite = true
        } else {
            let image : UIImage = UIImage.init(named: "grayHeart")!
            sender.setBackgroundImage(image, for: UIControl.State.normal)
            bFavorite = false
        }
    }
    @IBAction func buttonPlayPause(_ sender: UIButton) {
        SpeedStatus(set: true)
        if bPlayCard {
            bPlayCard = false
            let image : UIImage = UIImage.init(named: "play")!
            sender.setBackgroundImage(image, for: UIControl.State.normal)
            //TODO: Implement pause codes
        } else {
            bPlayCard = true
            let image : UIImage = UIImage.init(named: "pause")!
            sender.setBackgroundImage(image, for: UIControl.State.normal)
            //TODO: Implement play codes
        }
    }
    @IBAction func buttonSpeed(_ sender: UIButton) {
        if bSpeedHidden {
           SpeedStatus(set: false)
        }  else {
           SpeedStatus(set: true)
        }
    }
    @IBAction func buttonRepeat(_ sender: UIButton) {
        let image : UIImage?
        if repeatStatus == .repeatNo {
            repeatStatus = .repeatNormal
             image = UIImage.init(named: "repeat")
        } else if ( repeatStatus == .repeatNormal ) {
            repeatStatus = .repeatReverse
             image = UIImage.init(named: "repeatreverse")
        } else {
            repeatStatus = .repeatNo
             image = UIImage.init(named: "repeatno")
        }
        if let image = image {
        sender.setBackgroundImage(image, for: UIControl.State.normal)
        }
    }
    
    //MARK: - Slider
    @IBAction func sliderSpeed(_ sender: UISlider) {
        let speed : Int = Int ( sliderSpeed.value )
        sliderSpeed.setValue( Float (speed) , animated: true)
        labelSpeed.text = "Speed: Number of cards in minute (\(speed))"
    }
    
    //MARK: - Gestures
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
      //  if sender.state == .recognized {
        let applicationName : String = Bundle.main.infoDictionary? [kCFBundleNameKey as String] as! String
        
        let alert = UIAlertController.init(title: "\(applicationName)", message: "Perform a option for this card!", preferredStyle: UIAlertController.Style.actionSheet)
            let actionCategory = UIAlertAction.init(title: "Change category", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //TODO: - Chage the category of card
            }
            let actionDelete = UIAlertAction.init(title: "Delete card", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
                //TODO: - Delete this card
            }
            let actionFavorite = UIAlertAction.init(title: "Favorite it", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //TODO: - Set it as Favorite
            }
            let actionEdit = UIAlertAction.init(title: "Edit it", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //TODO: - Edit this card
            }
            let actionCancle = UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
                //TODO: - Cancel
            }
            alert.addAction(actionCategory)
            alert.addAction(actionEdit)
            alert.addAction(actionFavorite)
            alert.addAction(actionDelete)
            alert.addAction(actionCancle)
            self.present(alert, animated: true) {
                //TODO: Implement Action Completed
            }
       // }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    
    
    // MARK: Functions
    func SetStatus (for button : UIButton , _ with : Bool )  {
        if with == false  {
            button.isEnabled = false
            button.titleLabel?.textColor = UIColor.gray
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.opacity = 0.5
        }
        else {
            button.isEnabled = true
            button.titleLabel?.textColor = UIColor.black
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.opacity = 1
        }
    }
    func SpeedStatus (set with : Bool)  {
        labelSpeed.isHidden = with
        sliderSpeed.isHidden = with
        bSpeedHidden = with
    }

}
