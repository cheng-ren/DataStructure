//
//  Stack.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/28.
//

import Cocoa

class Stack<E: Equatable>: NSObject {
    
    private var elements: ArrayList<E> = ArrayList(capacity: 1)
    
    var count: Int { elements.count }
    
    var isEmpty: Bool { count == 0 }
    
    var peek: E? { elements[count - 1] }
    
    override init() {
        
    }
    
    func push(_ element: E) {
        elements.append(element)
    }
    
    func pop() {
        elements.remove(at: count - 1)
    }
    
    func removeAll() {
        elements.removeAll()
    }
    
    override var description: String {
        return String(describing: elements)
    }
    
}
