//
//  ContactManager.swift
//  ios-contact-manager-ui
//
//  Created by 미르, 루피 on 1/5/24.
//

import UIKit

final class ContactManager {
    private(set) var contacts: [Contact] = []
    
    func add(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func delete(index: IndexPath) {
        contacts.remove(at: index.row)
    }
    
    func update(_ contact: Contact) {
        guard let targetIndex = contacts.firstIndex(where: { $0.id == contact.id }) else {
            print("[ContactManager] can not find index")
            return
        }
        contacts[targetIndex] = contact
    }
    
    func parse() throws {
        do {
            contacts = try AssetDecoder<[Contact]>().parse(assetName: "MOCK_DATA")
        } catch {
            throw error
        }
    }
}

