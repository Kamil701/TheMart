//
//  UserInfo.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 11.12.23.
//

import Foundation

struct User {
    let id: String?
    let name: String
    let surname: String
    let phoneNumber: String
    let dateOfBirth: String
    let purchaseAmount: String
    let cashBack: String
    let accumulation: String
    
    init(
        id: String?,
        name: String,
        surname: String,
        phoneNumber: String,
        dateOfBirth: String,
        purchaseAmount: String,
        cashBack: String,
        accumulation: String
    ) {
        self.id = id
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
        self.purchaseAmount = purchaseAmount
        self.cashBack = cashBack
        self.accumulation = accumulation
    }
    
    var asDict: [String: Any] {
        var dict = [String: Any]()
        dict["name"] = name
        dict["surname"] = surname
        dict["phoneNumber"] = phoneNumber
        dict["dateOfBirth"] = dateOfBirth
        dict["purchaseAmount"] = purchaseAmount
        dict["cashBack"] = cashBack
        dict["accumulation"] = accumulation
        return dict
    }
    
    init(key: String, dict: [String: Any]) throws {
        guard let name = dict["name"] as? String,
              let surname = dict["surname"] as? String,
              let phoneNumber = dict["phoneNumber"] as? String,
              let dateOfBirth = dict["dateOfBirth"] as? String,
              let purchaseAmount = dict["purchaseAmount"] as? String,
              let cashBack = dict["cashBack"] as? String,
              let accumulation = dict["accumulation"] as? String
        else {
            let error = "Parsing user info error"
            print("Parser error \(error)")
            throw error
        }
        
        self.id = key
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
        self.purchaseAmount = purchaseAmount
        self.cashBack = cashBack
        self.accumulation = accumulation
    }
    
}
extension String: Error {}
