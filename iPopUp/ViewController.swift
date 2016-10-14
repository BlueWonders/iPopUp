//
//  ViewController.swift
//  iPopUp
//
//  Created by apple on 14.10.2016.
//  Copyright © 2016 BlueWonders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var PopUpView1: UIView! // POPUP
 
    var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    var blurEffectView = UIVisualEffectView()
   

    @IBAction func PopUp(_ sender: UIButton) {
        
        hizala()
        blur()
        animateIn()
        
    }

    @IBAction func dismissPopUp(_ sender: AnyObject) {
        removeBlur()
        animateOut()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeBlur()
        animateOut()
    }
    public func removeBlur() {
        blurEffectView.removeFromSuperview()
    }
    
    func blur(){
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
        
    }
    func animateIn() {
        
        self.view.addSubview(PopUpView1)
        PopUpView1.center = self.view.center
        
        PopUpView1.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        PopUpView1.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            
            self.PopUpView1.alpha = 1
            self.PopUpView1.transform = CGAffineTransform.identity
        }
        
    }
    
    public func animateOut () {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.PopUpView1.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.PopUpView1.alpha = 0
            
        }) { (success:Bool) in
            self.PopUpView1.removeFromSuperview()
        }
    }
    
    
    func hizala(){
        
        if GlobalVariables.sharedManager.isTablet() == true
        {
            print("TabletDETECTED")
            // PopUpView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 300, height: 300))
            
            PopUpView1.frame.origin.x = 0
            PopUpView1.frame.origin.y = 0
            
        }
        else{
            print("PhoneDetected")

           if  GlobalVariables.sharedManager.rotated() == true{

            
            PopUpView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: view.frame.width - 50, height: view.frame.height - 10))
            }
            
           else {
            
            
            PopUpView1.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: view.frame.width - 50, height: view.frame.height - 300))
            
            }
        }
        
        PopUpView1.layer.cornerRadius = 5 //make oval view edges
    }
    override func viewDidAppear(_ animated: Bool) {
        
        PopUpView1.setNeedsFocusUpdate()
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 
        
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        
        PopUpView1.center = view.center
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touches.first != nil{
            
            removeBlur()
            animateOut()
            
        }
        super.touchesBegan(touches , with:event)
        
    }

}

