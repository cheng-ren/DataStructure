//
//  main.swift
//  DynamicArray
//
//  Created by 任成 on 2020/11/18.
//

import Foundation


let arr = ArrayList<Person>(capacity: 2)
arr.add(Person(name: "jack", age: 20))
arr.add(Person(name: "Rose", age: 19))
print(arr.index(of: Person(name: "Rose1", age: 19)))
print(arr)
