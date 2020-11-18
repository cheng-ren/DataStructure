//
//  main.swift
//  DynamicArray
//
//  Created by 任成 on 2020/11/18.
//

import Foundation

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

let arr = ArrayList<Person>(capacity: 2)
arr.add(Person(name: "jack", age: 20))
arr.add(Person(name: "Rose", age: 19))
print(arr.index(of: Person(name: "Rose1", age: 19)))
print(arr)

//let arr = ArrayList<Int>(capacity: 2)
//arr.add(2)
//arr.add(3)
//arr.add(5)
//arr.insert(4, at: 0)
//print(arr.count)
//print(arr)
//arr.removeAll()
//print(arr.isEmpty())
