//
//  BinarySearchTree.swift
//  DataStructure
//
//  Created by 任成 on 2020/11/28.
//

import Cocoa

class BinarySearchTree<E: Comparable>: NSObject {
    
    private class Node<E: Comparable>: NSObject {
        var ele: E
        var left: Node?
        var right: Node?
        var parent: Node?
        
        init(_ ele: E, parent: Node?) {
            self.ele = ele
            self.parent = parent
        }
        
        static func == (lhs: BinarySearchTree<E>.Node<E>, rhs: BinarySearchTree<E>.Node<E>) -> Bool {
            return lhs.ele == rhs.ele
        }
        
        static func < (lhs: BinarySearchTree<E>.Node<E>, rhs: BinarySearchTree<E>.Node<E>) -> Bool {
            return lhs.ele < rhs.ele
        }
    }
        
    private var root: Node<E>?
    
    private(set) var count: Int = 0
    
    var isEmpty: Bool { count == 0 }
    
    override init() {
        
    }
    
    func append(_ element: E) {
        checkElementIsNull(element)
        
        if count == 0 {
            root = Node(element, parent: nil)
        } else {
            var tmp = root
            while tmp != nil {
                var next: Node<E>?
                if element < tmp!.ele {
                    next = tmp?.left
                    if next == nil {
                        tmp?.left = Node(element, parent: tmp)
                    }
                } else if element > tmp!.ele {
                    next = tmp?.right
                    if next == nil {
                        tmp?.right = Node(element, parent: tmp)
                    }
                } else {
                    tmp?.ele = element
                    return
                }
                tmp = next
            }
        }
        count += 1
    }
    
    func contains(_ element: E) -> Bool {
        
        return false
    }
    
    func remove(_ element: E) {
        
    }
    
    /// 清空树
    /// - min: O(1)
    func removeAll() {
        root = nil
        count = 0
    }
    
    /// 前序遍历
    func preorderTraversal() {
        preorderTraversal(root)
    }
    
    /// 中序遍历
    func inorderTraversal() {
        inorderTraversal(root)
    }
    
    /// 后序遍历
    func postorderTraversal() {
        postorderTraversal(root)
    }
    
    /// 层序遍历
    func levelOrderTraversal(_ map:((E) -> Void)?) {
        guard root != nil else { return }
        let queue = Queue<Node<E>>()
        queue.enQueue(root!)
        
        while queue.count > 0 {
            let node = queue.deQueue()
            (map != nil) ? map!(node.ele) : nil
            if node.left != nil {
                queue.enQueue(node.left!)
            }
            if node.right != nil {
                queue.enQueue(node.right!)
            }
        }
    }
    
    /// 检测元素为空
    /// - Parameter element: 元素
    /// - min: O(1)
    private func checkElementIsNull(_ element: E?) {
        if element == nil {
            exit(0)
        }
    }
    
    /// 前序遍历(中左右) - 递归
    private func preorderTraversal(_ node: Node<E>?) {
        guard node != nil else { return }
        print(node!.ele)
        preorderTraversal(node!.left)
        preorderTraversal(node!.right)
    }
    
    /// 中序遍历(左中右) - 递归
    private func inorderTraversal(_ node: Node<E>?) {
        guard node != nil else { return }
        inorderTraversal(node!.left)
        print(node!.ele)
        inorderTraversal(node!.right)
    }
    
    /// 后序遍历(左右中) - 递归
    private func postorderTraversal(_ node: Node<E>?) {
        guard node != nil else { return }
        postorderTraversal(node!.left)
        postorderTraversal(node!.right)
        print(node!.ele)
    }
    
    override var description: String {
        return String(describing: root?.ele)
    }
    
    
}
