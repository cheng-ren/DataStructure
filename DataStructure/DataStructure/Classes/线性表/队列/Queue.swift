//
//  Queue.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/28.
//

import Cocoa

class Queue<E: Equatable>: NSObject {
    private var elements: LinkedList<E> = LinkedList()
    
    var count: Int { elements.count }
    
    var isEmpty: Bool { count == 0 }
    
    var top: E? { elements[count - 1] }
    
    override init() {
        
    }
    
    func enQueue(_ element: E) {
        elements.append(element)
    }
    
    func deQueue() -> E {
        let ret = elements[0]
        elements.remove(at: 0)
        return ret
    }
    
    func removeAll() {
        elements.removeAll()
    }
    
    override var description: String {
        return String(describing: elements)
    }
}
