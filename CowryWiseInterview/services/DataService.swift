//
//  DataService.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class DataService {
    
    static let instance  = DataService()
    

    func convertCurrency(baseCurrency: String, convertedCurrency: String, completion:  @escaping CompletionHandler){
        
         let finalconvertCurrencyURL = URL_CONVERT_CURRENCY+"?access_key=\(API_KEY)"+"&base=\(baseCurrency)"+"&symbols=\(convertedCurrency)"
        
        Alamofire.request(finalconvertCurrencyURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString { (response) in
                if response.result.error == nil {
                    guard let data = response.data else { return }
                    var json = JSON(data: data)
                     ChangedCurrency = json["rates"][convertedCurrency].stringValue
                     completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any )
                }
        }

    }

}
