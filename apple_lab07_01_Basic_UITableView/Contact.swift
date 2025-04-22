//
//  Contact.swift
//  apple_lab07_01_Basic_UITableView
//
//  Created by developer on 4/22/25.
//

import Foundation

struct Contact {
    
    let name : String
    let phoneNumber : String
    
    static func mockContacts() -> [Contact] {
        return [
            Contact(name: "John Smith", phoneNumber: "555-1234"),
            Contact(name: "Emma Johnson", phoneNumber: "555-5678"),
            Contact(name: "Michael Brown", phoneNumber: "555-9012"),
            Contact(name: "Olivia Davis", phoneNumber: "555-3456"),
            Contact(name: "William Wilson", phoneNumber: "555-7890")
        ]
    }
    
    
    
    
}
