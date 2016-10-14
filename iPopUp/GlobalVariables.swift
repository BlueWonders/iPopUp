
//  Copyright © 2016 BlueWonders. All rights reserved.

 import UIKit
 import CloudKit
 
 class GlobalVariables{
    
    internal var version = "0.1"
    internal var iPadLogoYatayHeight :CGFloat = 76
    internal var iPadLogoDikeyHeight :CGFloat = 57
    internal var iPhoneLogoYatayHeight :CGFloat = 42
    internal var iPhoneLogoDikeyHeight :CGFloat = 24
    
    class var sharedManager : GlobalVariables{
        
        struct Static {
            
            static let instance = GlobalVariables()
        }
        
        return Static.instance
    }
    
    
    func getScreenBounds() -> CGRect
    {
 
        return UIScreen.main.bounds
    }
    
    func getScreenNativeBounds() -> CGRect
    {
 
        return UIScreen.main.nativeBounds
    }
    
    
    func getScreenLogoHeight()->CGFloat
    {
 
        var Yukseklik : CGFloat = 0
        
        if(isTablet()==true)
        {
            if (rotated() == true)
            {
                Yukseklik = iPadLogoYatayHeight
            }
            else
            {
                Yukseklik = iPadLogoDikeyHeight
            }
            
        }
        else
        {
            if (rotated() == true)
            {
                Yukseklik = iPhoneLogoYatayHeight
            }
            else
            {
                Yukseklik = iPhoneLogoDikeyHeight
            }
        }
        return Yukseklik
    }
    
    
    func isTablet() -> Bool
    {
 
        var iTablet : Bool = true
        
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
        {
            iTablet = true
        }else if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
        {
            iTablet = false
        }
        return iTablet
    }
    
    func rotated() -> Bool
    {
 
        var durum : Bool = true
        
        let screenSize : CGRect = UIScreen.main.bounds
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
        {
            durum  = true
        }
        else if (UIDeviceOrientationIsPortrait(UIDevice.current.orientation))
        {
            durum  = false
        }
        else
            if (screenSize.height>screenSize.width){
                durum = false
            }
            else
                if (screenSize.width>screenSize.height){
                    durum = true
        }
        return durum
        
    }
 
    
 }
