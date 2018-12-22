//
//  CGFloatExtension.swift
//  OgrenOgret
//
//  Created by Baran on 28.02.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit


//Mark: - Responsive cell size for screen
extension CGFloat {
    var calculateTableViewCellHeight : CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return screenWidth * self
    }
    
    var calculateCollectionViewCellWitdh : CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return screenWidth * self
    }
    
    func calculateCollectionViewCellHeigt(witdh: CGFloat) -> CGFloat {
        return witdh * self
    }
}

//Mark: -Random CGFloat
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    static func randomBlackColor() -> CGFloat {
        return CGFloat(arc4random_uniform(0)) / CGFloat(UInt32.max)
    }
}
//string to cgFloat
extension CGFloat {
    
    init?(string: String) {
        
        guard let number = NumberFormatter().number(from: string) else {
            return nil
        }
        
        self.init(number.floatValue)
    }
    
}

