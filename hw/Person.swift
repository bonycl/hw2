//
//  Person.swift
//  hw
//
//  Created by D i on 21.11.2023.
//

import Foundation
 
struct Person {
    let name: String
    let surname: String
    let email: String
    let phoneNumber: String
    
    static func generatePerson () -> [Person] {
        
        var persons: [Person] = []
        
        let names = DataManager.shared.firstNames.shuffled()
        let secondNames = DataManager.shared.lastNames.shuffled()
        let emails = DataManager.shared.randomEmails.shuffled()
        let phones = DataManager.shared.randomPhoneNumbers.shuffled()
        
        for index in 0..<names.count {
            let person = Person(name: names[index], surname: secondNames[index], email: emails[index], phoneNumber: phones[index])
            
            persons.append(person)
            
        }
        return persons
    }
    
}
