//
//  ArrayList.swift
//  ArrayListDemo
//
//  Created by 任成 on 2020/11/17.
//  顺序表练习

import Cocoa

public class ArrayList<E: Equatable>: NSObject {
    private let defaultCapacity = 5
    
    /// 为什么用 `Any`?, 因为初始化的时候, 需要传入默认值.
    private var elements: [Any?]!
    private(set) var count: Int = 0
    
    
    init(capacity: Int) {
        elements = Array(repeating: 0, count: capacity)
    }
    
    
    // MARK: 增
    
    public func add(_ element: E) {
        ensureCapacity(count)
        
        elements[count] = element
        count += 1
    }
    
    /// 插入元素到指定位置
    /// - Parameters:
    ///   - element: 元素
    ///   - index: 位置
    public func insert(_ element: E, at index: Int) {
        rangeCheckForAdd(index)
        ensureCapacity(count)
        
        for i in ((index + 1)...count).reversed() {
            elements[i] = elements[i - 1]
        }
        elements[index] = element
        count += 1
    }
    
    
    
    // MARK: 查
    
    /// 找到元素在数组中的首个位置
    /// - Parameter element: 元素
    /// - Returns: 下标
    public func index(of element: E) -> Int {
        for (i, ele) in elements.enumerated() {
            if element == ele as! E {
                return i
            }
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
        rangeCheck(index)
        return elements[index] as! E
    }
    
    
    // MARK: 删
    
    /// 删除某一个元素
    /// - Parameter index: 下标
    public func remove(at index: Int) {
        rangeCheck(index)
        for i in index..<count {
            elements[i] = elements[i+1]
        }
        count -= 1
        elements[count] = nil;
    }
    
    /// 清理所有元素
    public func removeAll() {
        for i in 0..<count {
            elements[i] = nil;
        }
        count = 0
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
        let oldCapacity = elements.count
        guard oldCapacity <= capacity else { return }
                
        // 新容量为旧容量的1.5倍
        let newCapacity = oldCapacity + (oldCapacity >> 1);
        var newElements: Array<Any?> = Array(repeating: 0, count: newCapacity)
        for i in 0..<count {
            newElements[i] = elements[i];
        }
        elements = newElements;
        
        print("\(oldCapacity) 扩容为 \(newCapacity)");
    }
    
    public override var description: String {
        return "\(String(describing: elements))"
    }
    
}
