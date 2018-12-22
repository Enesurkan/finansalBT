//
//  UIImageViewExtension.swift
//  OgrenOgret
//
//  Created by Baran on 12.04.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import Foundation
import SDWebImage

typealias downloadImageSuccessHandler = (_ Success : Bool) -> Void
extension UIImageView {
    
    
    func setImageUrl(_ url: String){
            if let url = URL(string: url) {
                self.sd_setIndicatorStyle(.white)
                self.sd_setShowActivityIndicatorView(true)
                self.sd_setImage(with: url, completed: nil)
                
            }
        }
    func setImageUrlSuccessHandler(_ url: String, success : downloadImageSuccessHandler?){
            if let url = URL(string: url) {
                self.sd_setIndicatorStyle(.white)
                self.sd_setShowActivityIndicatorView(true)
                self.sd_setImage(with: url) { (image, error, cacheType, url) in
                    if let success = success {
                        success(true)
                    }
                }
            }
        }
}

//Mark :- Image Change Color
extension UIImageView {
    func changeColor(_ color: UIColor) {
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}



