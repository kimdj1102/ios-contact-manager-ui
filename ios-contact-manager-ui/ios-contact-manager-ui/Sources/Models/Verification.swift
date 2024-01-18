//
//  Verification.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/11/24.
//

import Foundation

struct Verification {
    static func setName(_ name: String) -> Bool {
        let setName = name.split(separator: " ").reduce("") { $0 + $1 }
        return !setName.isEmpty
    }
    
    static func setAge(_ age: String) -> Bool {
        let regex = "^([1-9]{1})?([0-9]{1,2})$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: age)
    }
    
    static func setNumber(_ number: String) -> Bool {
        let regex = #"(\+[0-9]{2,3}\s?)?(\(0\))?\s?0?([0-9]{1,2})-([0-9]{3,4})-([0-9]{4})$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: number)
    }
}
