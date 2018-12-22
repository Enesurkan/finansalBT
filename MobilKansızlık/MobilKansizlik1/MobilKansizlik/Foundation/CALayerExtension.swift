//
//  CALayerExtension.swift
//  OgrenOgret
//
//  Created by Baran on 28.02.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit

//Mark: -Add Gradient
extension CALayer {
    
    func addGradientLayer(size: CGSize, colors: [CGColor]){
        removeGradientLayer()
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = size
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.name = "gradientLayer"
        self.addSublayer(gradientLayer)
    }
    
    
    //SizeHeightRate is beetwen 0-1
    func addVerticalGradientLayer(size: CGSize, colors: [CGColor], sizeHeigtRate: CGFloat?){
        removeGradientLayer()
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        if let rate = sizeHeigtRate {
            gradientLayer.frame = CGRect(x: 0, y: size.height * (1 - rate), width: size.width, height: size.height * rate)
        } else {
            gradientLayer.frame.size = size
        }
        gradientLayer.colors = colors
        gradientLayer.name = "gradientLayer"
        self.addSublayer(gradientLayer)
    }
    
    func removeGradientLayer(){
        if self.sublayers != nil {
            for layer in self.sublayers! {
                if layer.name == "gradientLayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
}

//Mark: -Add Shadow
extension CALayer {
    func addShadow(color: UIColor, shadowRadius: CGFloat = 8.0) {
        removeShadow()
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOffset = CGSize(width: 0, height: 1.0)
        self.shadowOpacity = 1.0
        self.shadowRadius = shadowRadius
        self.name = "shadowLayer"
    }
    
    func addShadow(color: UIColor, shadowRadius: CGFloat = 8.0, size: CGSize, cornerRadius: CGFloat) {
        removeShadow()
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOffset = size
        self.shadowOpacity = 1.0
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.name = "shadowLayer"
    }
    
    func removeShadow(){
        if self.sublayers != nil {
            for layer in self.sublayers! {
                if layer.name == "shadowLayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
}

//Mark: -Add Radius
extension CALayer {
    
    func addRadius(_ corners: UIRectCorner, radius: CGFloat, view: UIView) {
        let mask = CAShapeLayer()
        mask.bounds = view.frame
        mask.position = view.center
        mask.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        view.layer.mask = mask
    }
    
    func addRadius(radius: CGFloat) {
        self.cornerRadius = radius
    }
    
}

//Mark: -Add Border
extension CALayer {
    
    enum BorderSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide side: BorderSide, withColor color: CGColor, andThickness thickness: CGFloat, viewFrame: CGRect) {
        
        removeBorder()
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left: border.frame = CGRect(x: 0, y: 0, width: thickness, height: viewFrame.height)
        case .right: border.frame = CGRect(x: viewFrame.width - thickness, y: 0, width: thickness, height: viewFrame.height)
        case .top: border.frame = CGRect(x: 0, y: 0, width: viewFrame.width, height: thickness)
        case .bottom: border.frame = CGRect(x: 0, y: viewFrame.height - thickness, width: viewFrame.width, height: thickness)
        }
        border.name = "borderLayer"
        self.addSublayer(border)
    }
    
    
    func removeBorder(){
        if self.sublayers != nil {
            for layer in self.sublayers! {
                if layer.name == "borderLayer" {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
    
}



