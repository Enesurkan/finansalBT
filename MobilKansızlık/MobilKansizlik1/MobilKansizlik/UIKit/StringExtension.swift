//
//  StringExtension.swift
//  OgrenOgret
//
//  Created by Baran on 2.04.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import Foundation

//Mark: -String to URL
extension String {
    func toURL() -> URL?{
        if let url = URL(string: self) {
            return url
        }
        return nil
    }
}

//Mark: -Encoded and Decoded String
extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

//Mark: -Substring
extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

//Mark: -Raplace
extension String {
    func replaceImagePath() -> String{
         return self.replacingOccurrences(of: "\\", with: "/", options: .literal, range: nil)
    }
}

//Mark: -String to CGFloat


