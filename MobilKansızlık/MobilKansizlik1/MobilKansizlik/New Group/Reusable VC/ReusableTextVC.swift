//
//  ReusableTextVC.swift
//  dumen
//
//  Created by Enes urkan on 2.12.2018.
//  Copyright © 2018 dumen. All rights reserved.
//

import UIKit

class ReusableTextVC: BaseViewController {
    
    @IBOutlet weak var reusableScrollView: UIScrollView!{
        didSet{
            reusableScrollView.delegate = self
        }
    }
    @IBOutlet weak var reusableView: ReusableTextView!
    @IBOutlet weak var reusableHeight: NSLayoutConstraint!
    private var lastContentOffset: CGFloat = 0 //IPHONE_X_SERIES -44 olucak.
    var resultData = NewsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBOutlet weak var backView: UIView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reusableScrollView.contentSize.height = UIViewController.deviceHeight * 2
    }
}

extension ReusableTextVC{
    internal func configureUI(){
        self.reusableScrollView.resignFirstResponder()
        self.reusableView.descLabel.text = resultData.newsTitle
        self.reusableView.descTextView.text = resultData.newsDescription
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.backView.addGestureRecognizer(gesture)
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ReusableTextVC : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if ( -150 > scrollView.contentOffset.y) {
            self.back(animated: true, isModal: true)
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            scrollView.contentOffset.y = self.lastContentOffset
        }
    }
    
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

