//
//  LinkedList.swift
//  DynamicArray
//
//  Created by 任成 on 2020/11/18.
//  链表练习

import Cocoa


class LinkedList<E: Equatable> {
    private class Node<E> {
        let val: E
        var next: Node?
        
        init(_ val: E) {
            self.val = val
        }
    }
    
    private var first: Node<E>?
    private(set) var count: Int = 0
    
    init(capacity: Int) {
        
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
    
    public func append(_ element: E) {
        ensureCapacity(count)
        
        let newNode = Node(element)
        if count == 0 {
            first = newNode
        } else {
            let lastNode: Node? = searchNode(at: count - 1)
            lastNode?.next = newNode
        }
        count += 1
    }
    
    /// 插入元素到指定位置
    /// - Parameters:
    ///   - element: 元素
    ///   - index: 位置
    public func insert(_ element: E, at index: Int) {
        rangeCheckForAdd(index)
        ensureCapacity(count)
        
        let currNode = Node(element)
        if count == 0 {
            first = currNode
        } else {
            if index == 0 {
                let node = first
                currNode.next = node
                first = currNode
            } else if index == count {
                let lastNode = searchNode(at: index - 1)
                lastNode.next = currNode
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
    public func index(of element: E) -> Int {
        var node = first
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
    public func contains(_ element: E) -> Bool {
        return index(of: element) != -1
    }
    
    /// 获取某个下标的元素
    /// - Parameter index: 下标
    /// - Returns: 元素
    public func get(_ index: Int) -> E {
        let node = searchNode(at: index)
        return node.val
    }
    
    private func searchNode(at index: Int) -> Node<E> {
        rangeCheck(index)
        var node = first
        for _ in 0..<index {
            node = node?.next
        }
        return node!
    }
    
    
    // MARK: 删
    
    /// 删除某一个元素
    /// - Parameter index: 下标
    public func remove(at index: Int) {
        rangeCheck(index)
        if index == 0 {
            first = searchNode(at: index + 1)
        } else {
            let lastNode = searchNode(at: index - 1)
            let nextNode: Node? = index + 1 >= count ? searchNode(at: index + 1) : nil
            lastNode.next = nextNode
        }
        count -= 1
    }
    
    /// 清理所有元素
    public func removeAll() {
        count = 0
        first = nil
    }
    
    /// 下标检测
    /// - Parameter index: 下标
    private func rangeCheck(_ index: Int) {
        if (index < 0 || index >= count) {
            exit(1)
        }
    }
    
    /// 添加下标检测
    /// - Parameter index: 下标
    private func rangeCheckForAdd(_ index: Int) {
        if (index < 0 || index > count) {
            exit(1)
        }
    }
    
    /// 动态扩容
    private func ensureCapacity(_ capacity: Int) {
//        let oldCapacity = elements.count
//        guard oldCapacity <= capacity else { return }
//
//        // 新容量为旧容量的1.5倍
//        let newCapacity = oldCapacity + (oldCapacity >> 1);
//        var newElements: Array<Any> = Array(repeating: 0, count: newCapacity)
//        for i in 0..<count {
//            newElements[i] = elements[i];
//        }
//        elements = newElements;
//
//        print("\(oldCapacity) 扩容为 \(newCapacity)");
    }
    
}
