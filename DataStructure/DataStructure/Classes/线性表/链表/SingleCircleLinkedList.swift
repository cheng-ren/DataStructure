//
//  SingleCircleLinkedList.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/25.
//

import Cocoa

public class SingleCircleLinkedList<E: Equatable>: NSObject {
    private class Node<E> {
        var val: E
        var next: Node?
        
        init(_ val: E) {
            self.val = val
        }
    }
    
    private var head: Node<E>?
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
        insert(element, at: count)
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
            currNode.next = currNode
        } else {
            if index == 0 {
                let node = head
                currNode.next = node
                head = currNode
            } else if index == count {
                let lastNode = searchNode(at: index - 1)
                lastNode.next = currNode
                currNode.next = head
            } else {
                let lastNode = searchNode(at: index - 1)
                let nextNode = searchNode(at: index)
                lastNode.next = currNode
                currNode.next = nextNode
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
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node!
    }
    
    
    // MARK: 删
    
    /// 删除某一个元素
    /// - Parameter index: 下标
    /// - min: O(1) max:  O(n) avg: O(n)
    public func remove(at index: Int) {
        rangeCheck(index)
        if count == 1 {
            head = nil
        } else if index == 0 {
            head?.val = head!.next!.val
            head?.next = head?.next?.next
        } else {
            let lastNode = searchNode(at: index - 1)
            let nextNode: Node? = index + 1 >= count ? searchNode(at: index + 1) : nil
            lastNode.next = nextNode
        }
        count -= 1
    }
    
    /// 清理所有元素
    /// - min: O(1)
    public func removeAll() {
        count = 0
        head = nil
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
        for _ in 0..<count {
            prin += " \(nextNode!.val)_\(nextNode!.next!.val) ->"
            nextNode = nextNode?.next
        }
        
        prin = String(prin.prefix(prin.count - 2))
        return prin + "]"
    }

}
