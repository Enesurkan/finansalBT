//
//  UIViewExtension.swift
//  CineDB
//
//  Created by Baran Karaoğuz on 30.08.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}


extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIView{
     func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {
        
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            let overlay = UIView()
            overlay.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = UIColor.black.cgColor
            overlay.alpha = 0.7
            overlay.tag = 5
            
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubviewToFront(overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        indicator.startAnimating()
        indicator.stopAnimating()
    }
    
     func hideActivityIndicator(view: UIView) {
        
        // stop the network activity animation in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // remove the activity indicator and optional overlay views
        view.viewWithTag(5)?.removeFromSuperview()
    }
}
//Mark : Bluer Effect Added

extension UIView {
    
    /// Remove UIBlurEffect from UIView
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}
extension UIView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}
