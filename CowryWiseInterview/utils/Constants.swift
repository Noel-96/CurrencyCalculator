//
//  Constants.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import Foundation


var ChangedCurrency: String!


// API limitations prevented me from using "https"  here 
//base_url
let BASE_URL =  "http://data.fixer.io/api/"
//convert currency url
let URL_CONVERT_CURRENCY =  "\(BASE_URL)latest"




//api_key
//apologies this key is supposed to be encrypted or gotten from the server ☹️😔
let API_KEY = "d9f780e068dea42e1a1e7d3b037ef511"

//completion handler
typealias CompletionHandler = (_ Success: Bool) -> ()


//header
let HEADER = [
    "Content-Type": "application/x-www-form-urlencoded"
]
