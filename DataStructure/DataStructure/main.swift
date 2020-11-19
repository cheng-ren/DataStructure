//
//  main.swift
//  DynamicArray
//
//  Created by 任成 on 2020/11/18.
//

import Foundation

let arr = LinkedList<Int>()

for _ in 0..<10000 {
    arr.insert(20, at: 0)
//    arr.append(20)
    print(arr.count)
}

print("结束")

//let arr = ArrayList<Person>(capacity: 2)
//arr.add(Person(name: "jack", age: 20))
//arr.add(Person(name: "Rose", age: 19))
//print(arr.index(of: Person(name: "Rose1", age: 19)))
//print(arr)
