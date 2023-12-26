//
//  Environment.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 11.12.23.
//

import Foundation
import FirebaseDatabase

struct Environment {
    static let ref = Database.database(url: "https://themart-b3a72-default-rtdb.firebaseio.com").reference()
}

