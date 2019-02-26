//
//  ContactStruct.swift
//  ContactList
//
//  Created by IMCS2 on 2/25/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import Foundation

struct ContactStruct{
    let givenname: String
    let familyname: String
    let number: String
    let email : String
    
    
    init(givenname: String,familyname: String ,number: String,email : String) {
        self.givenname = givenname
        self.familyname = familyname
        self.number = number
        self.email = email
    }
    
    
}
