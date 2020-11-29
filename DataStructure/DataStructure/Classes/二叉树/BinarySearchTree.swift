//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/28.
//

import Cocoa

class BinarySearchTree<E: Comparable>: NSObject {
    
    private class Node<E: Comparable>: NSObject {
        static func == (lhs: BinarySearchTree<E>.Node<E>, rhs: BinarySearchTree<E>.Node<E>) -> Bool {
            return lhs.ele == rhs.ele
        }
        
        static func < (lhs: BinarySearchTree<E>.Node<E>, rhs: BinarySearchTree<E>.Node<E>) -> Bool {
            return lhs.ele == rhs.ele
        }

        
        
        var ele: E
        var left: Node?
        var right: Node?
        var parent: Node?
        
        init(_ ele: E, parent: Node?) {
            self.ele = ele
            self.parent = parent
        }
    }
    
    private var elements: ArrayList<Node<E>> = ArrayList(capacity: 1)
    
    private var root: Node<E>?
    
    var count: Int { elements.count }
    
    var isEmpty: Bool { count == 0 }
    
    override init() {
        
    }
    
    func append(_ element: E) {
        checkElementIsNull(element)
        
        guard count > 0 else {
            root = Node(element, parent: nil)
            return
        }
        
        var tmp = root
        
        while tmp != nil {
            if element < tmp! as! E {
                
            }
        }
    }
    
    func contains(_ element: E) -> Bool{
        return false
    }
    
    func remove(_ element: E) {
        
    }
    
    func removeAll() {
        
    }
    
    /// 检测元素为空
    /// - Parameter element: 元素
    /// - min: O(1)
    private func checkElementIsNull(_ element: E?) {
        if element == nil {
            exit(0)
        }
    }
    
    override var description: String {
        return String(describing: elements)
    }
    
    
}
