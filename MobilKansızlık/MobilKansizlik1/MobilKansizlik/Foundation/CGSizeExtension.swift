//
//  CGSizeExtension.swift
//  CineDB
//
//  Created by Baran on 11.08.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit

extension CGSize {
    
    static var sliderCellSize : CGSize {
        return CGSize(width: (UIViewController.deviceWidth * 0.85), height: (UIViewController.deviceWidth * 0.45))
    }
    
    static var movieCellSize : CGSize {
        return CGSize(width: (UIViewController.deviceWidth * 0.4), height: ((UIViewController.deviceWidth  * 0.4) * 1.5))
    }
    
    
    static var MyProfileUserCellSize : CGSize {
        return CGSize(width: (UIViewController.deviceWidth  - 60) / 2, height: ((UIViewController.deviceWidth - 60) / 2))
    }
    
    static var miniContentCell : CGSize {
        return CGSize(width: (UIViewController.deviceWidth * 0.25), height: ((UIViewController.deviceWidth  * 0.25) * 1.714))
    }
    
    static var allMoviesCell : CGSize {
        return CGSize(width: ((UIViewController.deviceWidth - 80) * 0.5), height: (((UIViewController.deviceWidth - 80) * 0.5) * 1.5))
    }
    
    static var allActorsCell : CGSize {
        return CGSize(width: ((UIViewController.deviceWidth - 70) * 0.3), height: (((UIViewController.deviceWidth - 70) * 0.3) * 1.333))
    }
    
}
