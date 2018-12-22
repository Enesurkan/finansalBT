//
//  PriceModel.swift
//  TestExample
//
//  Created by Enes urkan on 1.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class PriceModel : NSObject, Mappable {
    var date : String?
    var base : String?
    var rates : RatesModel?
    
    override init() {
        super.init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        base <- map["base"]
        rates <- map["rates"]
    }
    
}
