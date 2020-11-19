//
//  LinkedListTest.swift
//  DataStructureTest
//
//  Created by 任成 on 2020/11/18.
//

import XCTest

class LinkedListTest: XCTestCase {
    
    // MARK: 增
    
    func testAppend() {
        let arr = LinkedList<Int>()
        arr.append(2)
        XCTAssertTrue(arr.contains(2), "找到指定元素")
        XCTAssertFalse(arr.contains(0), "找到指定元素")
    }
    
    func testInsert() {
        let arr = LinkedList<Int>()
        arr.insert(3, at: 0)
        arr.insert(4, at: 1)
        XCTAssertEqual(arr.count, 2)
        XCTAssertEqual(arr[0], 3)
        XCTAssertEqual(arr[1], 4)
    }
    
    
    // MARK: 删
    
    func testRemove() {
        let arr = LinkedList<Int>()
        arr.append(10)
        arr.append(20)
        arr.append(30)
        arr.append(40)
        XCTAssertEqual(arr.count, 4)
        arr.remove(at: 0)
        XCTAssertEqual(arr[0], 20)
        XCTAssertEqual(arr[1], 30)
        arr.removeAll()
        XCTAssertEqual(arr.count, 0)
    }
    
    
    // MARK: 改
    
    func testUpdate() {
        let arr = LinkedList<Int>()
        arr.append(10)
        arr.append(20)
        XCTAssertEqual(arr[1], 20)
        arr[0] = 5
        arr[1] = 30
        XCTAssertEqual(arr[0], 5)
        XCTAssertEqual(arr[1], 30)
    }
    
    // MARK: 查
    
    func testEmpty() {
        let arr = LinkedList<Int>()
        arr.append(10)
        XCTAssertFalse(arr.isEmpty())
        arr.removeAll()
        XCTAssertTrue(arr.isEmpty())
    }
    
    func testSearchIndex() {
        let arr = LinkedList<Int>()
        arr.append(10)
        arr.append(20)
        arr.append(10)
        XCTAssertEqual(arr.index(of: 10), 0)
        XCTAssertEqual(arr.index(of: 20), 1)
    }
    
    func testContains() {
        let arr = LinkedList<Int>()
        arr.append(10)
        arr.append(20)
        XCTAssertTrue(arr.contains(10))
        XCTAssertFalse(arr.contains(30))
    }
    
    
    // MARK: 其他
    
    func testCapacity() {
        
    }
    
    
    // MARK: 性能
    
    func testPerformance() {
        let arr = LinkedList<Int>()
        measure {
            for _ in 0..<10000 {
                arr.insert(20, at: 0)
            }
        }
    }
}
