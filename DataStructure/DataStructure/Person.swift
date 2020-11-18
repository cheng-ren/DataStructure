//
//  Person.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/18.
//

import Cocoa

struct Person: Equatable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age
    }
    
    let name: String
    let age: Int
    
    init() {
        name = ""
        age = 0
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
