//
//  LocalDataService.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import Foundation

class LocalDataService {
    
    static var instance = LocalDataService()
    
    private let CurrencyLists = [
        Currency(CurrencyName: "(₦) Naira", CurrencySign: "NGN", CurrencyImg: "nigerian_flag.png"),
        Currency(CurrencyName: "(£) Pounds", CurrencySign: "GBP", CurrencyImg: "great-britain.png"),
        Currency(CurrencyName: "(¥) Yen", CurrencySign: "JPY", CurrencyImg: "japan.png"),
        Currency(CurrencyName: "($) Dollars", CurrencySign: "USD", CurrencyImg: "usa.png"),
        Currency(CurrencyName: "(R) Rand", CurrencySign: "ZAR", CurrencyImg: "south-africa.png"),
        Currency(CurrencyName: "(C$) Canadian dollars", CurrencySign: "CAD", CurrencyImg: "canada.png")
    ]
    
    
    func getCurrencyLists() -> [Currency] {
        return CurrencyLists
    }
    
}
