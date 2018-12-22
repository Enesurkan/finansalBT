//
//  NewsModel.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 9.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsModel : NSObject, Mappable{
   
    var newsImage : String?
    var newsTitle : String?
    var newsDescription: String?
    
    override init() {
        super .init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        newsImage <- map["newsImage"]
        newsTitle <- map["newsTitle"]
        newsDescription <- map["newsDescription"]
    }
}


