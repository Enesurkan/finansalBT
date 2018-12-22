//
//  IntExtension.swift
//  OgrenOgret
//
//  Created by Baran on 3.04.2018.
//  Copyright © 2018 CodingMind. All rights reserved.
//

import Foundation

//Mark: -Int veriable to string and fetch hour, minute, second
extension Int {
    func secondsToFormattedString() -> String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let second = (self % 3600) % 60
        let hoursString: String = {
            let hs = String(hours)
            return hs
        }()
        
        let minutesString: String = {
            var ms = ""
            if  (minutes <= 9 && minutes >= 0) {
                ms = "0\(minutes)"
            } else{
                ms = String(minutes)
            }
            return ms
        }()
        
        let secondsString: String = {
            var ss = ""
            if  (second <= 9 && second >= 0) {
                ss = "0\(second)"
            } else{
                ss = String(second)
            }
            return ss
        }()
        
        var label = ""
        if hours == 0 {
            label =  minutesString + ":" + secondsString
        } else{
            label = hoursString + ":" + minutesString + ":" + secondsString
        }
        return label
    }
}


