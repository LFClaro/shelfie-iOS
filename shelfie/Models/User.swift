//
//  User.swift
//  shelfie
//
//  Created by SaiRam Avala on 2022-04-21.
//

import Foundation
import Firebase

struct User {
    
    let firstname: String
    let lastname: String
    let email: String 
    
   
    init(firstname: String,lastname: String, email: String) {
        
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
    }
    func toUserObject() -> Any {
        return [
            "firstname": firstname,
            "lastname": lastname,
            "email" : email
        ]
    }
}




