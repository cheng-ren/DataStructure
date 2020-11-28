//
//  Stack.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/28.
//

import Cocoa

class Stack<E>: NSObject {
    
    private var elements: Array<E> = []
    
    var count: Int { elements.count }
    
    var isEmpty: Bool { count == 0 }
    
    var front: E? { elements.last }
    
    override init() {
        
    }
    
    func push(_ element: E) {
        elements.append(element)
    }
    
    func pop() {
        elements.removeLast()
    }
    
    func removeAll() {
        elements.removeAll()
    }
    
    override var description: String {
        return String(describing: elements)
    }
    
}
