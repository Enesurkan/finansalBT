//
//  UIColorExtension.swift
//  OgrenOgret
//
//  Created by Baran on 28.02.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit

extension UIColor {
    static var kshadowBlack : UIColor {
        return UIColor(red: 44.0/255.0, green: 44.0/255.0, blue: 44.0/255.0, alpha: 0.95)
    }
    
    static var kturkuaz : UIColor {
        return UIColor(red: 226.0/255.0, green: 231.0/255.0, blue: 248.0/255.0, alpha: 1.0)
    }
    
    static var kGradientBlue : UIColor {
        return UIColor(red: 120.0/255.0, green: 170.0/255.0, blue: 237.0/255.0, alpha: 1.0)
    }
    
    static var kGradientPurple : UIColor {
        return UIColor(red: 26.0/255.0, green: 2.0/255.0, blue: 150.0/255.0, alpha: 1.0)
    }
    
    static var kPurple : UIColor {
        return UIColor(red: 53.0/255.0, green: 51.0/255.0, blue: 175.0/255.0, alpha: 1.0)
    }
    
    static var kYellowButton : UIColor {
        return UIColor(red: 254.0/255.0, green: 186.0/255.0, blue: 2.0/255.0, alpha: 1.0)
    }
    
    static var kButtonText : UIColor {
        return UIColor(red: 28.0/255.0, green: 34.0/255.0, blue: 138.0/255.0, alpha: 1.0)
    }
    
    static var kSeparator : UIColor {
        return UIColor(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 1.0)
    }
    
    static var kDescLabel : UIColor {
        return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
}

//Mark: -Random UIColor
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

//Mark: -Gradiend Colors
extension UIColor {
    static func gradientBlackColors() -> [CGColor] {
        let colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(1.0).cgColor]
        return colors
    }
}

extension UIColor {
    static func gradientTopToBottomBlackColors() -> [CGColor] {
        let colors = [UIColor.black.withAlphaComponent(0.85).cgColor, UIColor.clear.cgColor]
        return colors
    }
}



