//
//  ServiceManager.swift
//  TestExample
//
//  Created by Busra Filgir on 4.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON
import AlamofireObjectMapper

class ServiceManager: NSObject {

    var AlamofireManager : Alamofire.SessionManager?
    
    static var shared = ServiceManager()
    
    func initServiceManager() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 120
        self.AlamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getNews(_ completionHandler:@escaping (GeneralResultModel?) -> Void) {
        
        let headers : [String : String] = [
            "Content-Type" : "application/json"
        ]
        
        DataSource(.get, url: "KansizlikNews" , headers: headers, responseType: GeneralResultModel.self) { (responseData , error) -> Void in
            guard responseData != nil else {
                completionHandler(nil)
                return
            }
            completionHandler(responseData)
        }
    }
    
    func getTestDesc(_ completionHandler:@escaping (GeneralTestModel?) -> Void) {
        
        let headers : [String : String] = [
            "Content-Type" : "application/json"
        ]
        
        DataSource(.get, url: "KansizlikTestDesc" , headers: headers, responseType: GeneralTestModel.self) { (responseData , error) -> Void in
            guard responseData != nil else {
                completionHandler(nil)
                return
            }
            completionHandler(responseData)
        }
    }
    
    
    func postTestValue(_ userTestModel: UserTest, completionHandler:@escaping (TestResultModel?) -> Void) {
        
        let headers : [String : String] = [
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String : String] = [
            "RBC" : userTestModel.RBC,
            "HGB" : userTestModel.HGB,
            "HCT" : userTestModel.HCT,
            "MCH" : userTestModel.MCH,
            "MCV" : userTestModel.MCV
            
        ]
        DataSource(.post, url: "KansizlikTest" , parameters: parameters, headers: headers, responseType: TestResultModel.self) { (responseData , error) -> Void in
            guard responseData != nil else {
                completionHandler(nil)
                return
            }
            completionHandler(responseData)
        }

    }


    
    func DataSource<T:Mappable>(_ requestType:HTTPMethod, url:String!, parameters: Parameters? = nil, headers : [String:String], isMainPage:Bool? = false ,responseType: T.Type?, SSLNeeded:Bool? = false , encoding:ParameterEncoding? = JSONEncoding.default , isAlertSilent:Bool? = false, printJSON:Bool? = false, attemptCount:Int? = 0,  completionHandler:((_ responseData:T? , _ error:NSError?) ->Void)?) {
        
        AlamofireManager!.request((BaseService.baseUrl + url), method: requestType, parameters: parameters , encoding:encoding!, headers:headers).validate().responseObject{ (response: DataResponse<T>) in
            if response.result.isFailure {
                if response.response?.statusCode != nil {
                    if response.response?.statusCode == 500  {
                        print("500 Error")
                    } else if (response.result.error as? AFError)?._code == NSURLErrorTimedOut {
                    } else {
                        if let data = response.data {
                            let responseJSON = try? JSON(data: data)
                        }
                        completionHandler!(nil , response.result.error as NSError?)
                    }
                }
            } else {
                if let data = response.result.value {
                    completionHandler!(data , nil)
                }
            }
        }
    }

}
