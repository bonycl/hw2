//
//  Person.swift
//  hw
//
//  Created by D i on 21.11.2023.
//

import Foundation

struct Person {
    var name: String
    var surname: String
    var email: String
    var phoneNumber: String
    
    static func generatePerson () -> [Person] {
        
        var person: [Person] = []
        
        for _ in 1...20 {
            let names = DataManager.shared.names.shuffle() 
            
            let person = "\(firstName) \(secondName)"
            
            let newPersonArray = people.contains("\(person)")
            if !newPersonArray {
                people.append(person)
                emailDetail.append(rndEmail)
                phoneDetail.append(rndPhone)
            } else {
                print(" found a copy of person ")
            }
            
            number += 1
            print(number)
        }
        print("cycles - \(number)")
        print("people - \(people.self.count)")
        print("emails - \(emailDetail.self.count)")
        print("phones - \(phoneDetail.self.count)")
    }
    
    
    
}
