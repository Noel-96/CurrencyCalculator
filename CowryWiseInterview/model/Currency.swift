//
//  Currency.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import Foundation

struct Currency {
    
    private(set) public var CurrencyName: String!
    private(set) public var CurrencySign: String!
    private(set) public var CurrencyImg: String!
    
    init(CurrencyName: String, CurrencySign: String, CurrencyImg: String) {
        self.CurrencyName = CurrencyName
        self.CurrencySign = CurrencySign
        self.CurrencyImg  = CurrencyImg
    }
    
}
