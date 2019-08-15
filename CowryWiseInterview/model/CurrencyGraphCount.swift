//
//  CurrencyGraphCount.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 13/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//
import Foundation
import RealmSwift

class CurrencyGraphCount: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var count: Double = Double()
    
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}
