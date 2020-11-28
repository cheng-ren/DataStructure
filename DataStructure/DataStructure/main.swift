//
//  main.swift
//  DynamicArray
//
//  Created by 任成 on 2020/11/18.
//

import Foundation

let stack = Queue<Int>()
stack.enQueue(12)
stack.enQueue(13)
stack.enQueue(14)
stack.deQueue()
print(stack)

//let arr = SingleCircleLinkedList<Int>()
//arr.append(10)
//arr.append(20)
//arr.append(30)
//arr.append(40)
//arr.remove(at: 0)
//print(arr)

//let arr = LinkedList<Int>()
//arr.append(10)
//arr.append(20)
//arr.append(30)
//arr.append(40)
//arr.remove(at: 0)
//print(arr)

//let arr = SignleLinkedList<Int>()
//
//for _ in 0..<10000 {
//    arr.insert(20, at: 0)
////    arr.append(20)
//    print(arr.count)
//}

print("结束")

//let arr = ArrayList<Person>(capacity: 2)
//arr.add(Person(name: "jack", age: 20))
//arr.add(Person(name: "Rose", age: 19))
//print(arr.index(of: Person(name: "Rose1", age: 19)))
//print(arr)
