//
//  LinkedList.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/23.
//

import Cocoa

public class LinkedList<E: Equatable>: NSObject {
    private class Node<E>: NSObject {
        let val: E
        var next: Node?
        var prev: Node?
        
        init(_ val: E) {
            self.val = val
        }
        
        override var description: String {
            return "\(val)"
        }
    }
    
    private var head: Node<E>?
    private var last: Node<E>?
    private(set) var count: Int = 0
    
    override init() {
        
    }
    
    subscript(index: Int) -> E {
        set {
            insert(newValue, at: index)
        }
        get {
            searchNode(at: index).val
        }
    }
    
    
    // MARK: 增
    
    
    /// 追加一个新元素
    /// - Parameter element: 元素
    /// - min: O(1) max:  O(n) avg: O(n)
    public func append(_ element: E) {
        self.insert(element, at: count)
    }
    
    /// 插入元素到指定位置
    /// - Parameters:
    ///   - element: 元素
    ///   - index: 位置
    /// - min: O(1) max:  O(n) avg: O(n)
    public func insert(_ element: E, at index: Int) {
        rangeCheckForAdd(index)
        
        let currNode = Node(element)
        if count == 0 {
            head = currNode
            last = currNode
        } else {
            if index == 0 { // 5
                currNode.next = head
                head?.prev = currNode
                head = currNode
            } else if index == count {
                let prevNode = last
                prevNode?.next = currNode
                currNode.prev = prevNode
                last = currNode
            } else {
                let nextNode = searchNode(at: index)
                let prevNode = nextNode.prev
                currNode.prev = prevNode
                currNode.next = nextNode
                nextNode.prev = currNode
                prevNode?.next = currNode
            }
        }
        count += 1
    }
    
    
    
    // MARK: 查
    
    /// 找到元素在数组中的首个位置
    /// - Parameter element: 元素
    /// - Returns: 下标
    /// - min: O(1) max:  O(n) avg: O(n)
    public func index(of element: E?) -> Int {
        var node = head
        for index in 0..<count {
            if node?.val == element {
                return index
            }
            node = node?.next
        }
        return -1
    }
    
    /// 动态是否为空
    public func isEmpty() -> Bool {
        count == 0
    }
    
    /// 数组是否包含某个元素
    /// - Parameter element: 元素
    /// - Returns: 是否包含
    /// - min: O(1) max:  O(n) avg: O(n)
    public func contains(_ element: E) -> Bool {
        return index(of: element) != -1
    }
    
    /// 获取某个下标的元素
    /// - Parameter index: 下标
    /// - Returns: 元素
    /// - min: O(1) max:  O(n) avg: O(n)
    public func get(_ index: Int) -> E {
        let node = searchNode(at: index)
        return node.val
    }
    
    
    /// 根据下标找元素
    /// - Parameter index: 下标
    /// - Returns: 元素
    /// - min: O(1) max:  O(n) avg: O(n)
    private func searchNode(at index: Int) -> Node<E> {
        rangeCheck(index)
        if index <= (count >> 2) {
            var node = head
            for _ in 0..<index {
                node = node?.next
            }
            return node!
        } else {
            var node = last
            for _ in 0..<(count - index - 1) {
                node = node?.prev
            }
            return node!
        }
    }
    
    
    // MARK: 删
    
    /// 删除某一个元素
    /// - Parameter index: 下标
    /// - min: O(1) max:  O(n) avg: O(n)
    public func remove(at index: Int) {
        rangeCheck(index)
        if index == 0 {
            head = head?.next
            head?.prev = nil
        } else {
            let node = searchNode(at: index)
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
        count -= 1
    }
    
    /// 清理所有元素
    /// - min: O(1)
    public func removeAll() {
        count = 0
        head = nil
        last = nil
    }
    
    /// 下标检测
    /// - Parameter index: 下标
    /// - min: O(1)
    private func rangeCheck(_ index: Int) {
        if (index < 0 || index >= count) {
            exit(1)
        }
    }
    
    /// 添加下标检测
    /// - Parameter index: 下标
    /// - min: O(1)
    private func rangeCheckForAdd(_ index: Int) {
        if (index < 0 || index > count) {
            exit(1)
        }
    }
    
    public override var description: String {
        var prin: String = "["
        var nextNode: Node? = head
        while nextNode != nil {
            prin += " \(nextNode!.val) ->"
            nextNode = nextNode?.next
        }
        
        prin = String(prin.prefix(prin.count - 2))
        return prin + "]"
    }

}
