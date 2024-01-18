//
//  Contact.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/5/24.
//

import Foundation

struct Contact: Decodable {
    var id = UUID()
    let name: String
    let phoneNumber: String
    let age: String
    
    var nameAndAge: String {
        return "\(name)(\(age))"
    }
}
