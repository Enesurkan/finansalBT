//
//  RatesModel.swift
//  TestExample
//
//  Created by Enes urkan on 1.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import Foundation
import ObjectMapper

class RatesModel : NSObject, Mappable {
    var BGN : Double?
    var CAD : Double?
    var BRL : Double?
    var HUF : Double?
    var DKK : Double?
    var JPY : Double?
    var ILS : Double?
    var TRY : Double?
    var RON : Double?
    var GBP : Double?
    var PHP : Double?
    var HRK : Double?
    var NOK : Double?
    var USD : Double?
    var MXN : Double?
    var AUD : Double?
    var IDR : Double?
    var KRW : Double?
    var HKD : Double?
    var ZAR : Double?
    var ISK : Double?
    var CZK : Double?
    var THB : Double?
    var MYR : Double?
    var NZD : Double?
    var PLN : Double?
    var SEK : Double?
    var RUB : Double?
    var CNY : Double?
    var SGD : Double?
    var CHF : Double?
    var INR : Double?
 
    override init() {
        super.init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.BGN <- map["BGN"]
        self.CAD <- map["CAD"]
        self.BRL <- map["BRL"]
        self.HUF <- map["HUF"]
        self.DKK <- map["DKK"]
        self.JPY <- map["JPY"]
        self.ILS <- map["ILS"]
        self.TRY <- map["TRY"]
        self.RON <- map["RON"]
        self.GBP <- map["GBP"]
        self.PHP <- map["PHP"]
        self.HRK <- map["HRK"]
        self.NOK <- map["NOK"]
        self.USD <- map["USD"]
        self.MXN <- map["MXN"]
        self.AUD <- map["AUD"]
        self.IDR <- map["IDR"]
        self.KRW <- map["KRW"]
        self.HKD <- map["HKD"]
        self.ZAR <- map["ZAR"]
        self.ISK <- map["ISK"]
        self.CZK <- map["CZK"]
        self.THB <- map["THB"]
        self.MYR <- map["MYR"]
        self.NZD <- map["NZD"]
        self.PLN <- map["PLN"]
        self.SEK <- map["SEK"]
        self.RUB <- map["RUB"]
        self.CNY <- map["CNY"]
        self.SGD <- map["SGD"]
        self.CHF <- map["CHF"]
        self.INR <- map["INR"]
    }
    

}

class RatesContainerModel : NSObject {

    var rates : [PriceDetailModel] = []
    
}
