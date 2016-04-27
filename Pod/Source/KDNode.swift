//
//  KDNode.swift
//  Pods
//
//  Created by Adam J Share on 4/22/16.
//
//

import Foundation


public class KDNode<Element: LocationValue, T: BoundingValues> {
    
    var location: Element!
    var bounds: T!
    
    var left: KDNode?
    var right: KDNode?
    
    var depth: Int = 0
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isLeft: Bool {
        return parent?.left == self
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    weak var parent: KDNode? {
        didSet {
            if let parent = parent {
                splitAxis = parent.splitAxis + 1
                depth = parent.depth + 1
            }
            else {
                splitAxis = 0
                depth = 0
            }
        }
    }
    
    init?(values: [Element], parent: KDNode?) {
        if values.count == 0 {
            return nil
        }
        
        self.parent = parent
        location = centroidLocationFromValues(values)
        
        setChildren(values)
    }
    
    func setChildren(values: [Element]) {
        let split = splitValues(values)
        
        left = KDNode(values: split.left, parent: self)
        right = KDNode(values: split.right, parent: self)
    }
    
    /**
     Simple centroid from average of each axis. Override for a custom algorithm.
     */
    func centroidLocationFromValues(values: [Element]) -> Element {
        
        if values.count == 1 {
            return values.first!
        }
        
        var sumStore: [Int: Double] = [:]
        let count: Double = Double(values.count)
        let range = values.first!.indices
        
        for i in range {
            sumStore[i] = 0
        }
        
        values.forEach { (value) in
            
            for i in range {
                sumStore[i] = sumStore[i]! + value[i]!
            }
        }
        
        var locationValue = Element()
        for i in range {
            locationValue[i] = sumStore[i]! / count
        }
        
        return locationValue
    }
    
    /**
     Index of value array to sort and split.
     */
    var splitAxis: Int = 0
    
    var splitPlane: [Double] = []
    
    /**
     Simple alternating axis split. Override to implement a custom algorithm.
     */
    func splitValues(values: [Element]) -> (left: [Element], right: [Element]) {
        
        if values.count == 1 {
            return ([], [])
        }
        
        if splitAxis >= values.first?.endIndex {
            splitAxis = 0
        }
        
        var left: [Element] = []
        var right: [Element] = []
        
        for value in values {
            if shouldLocateLeft(value) {
                left.append(value)
            } else {
                right.append(value)
            }
        }
        
        // In case of failed split from equal values
        if left.count > 0 && right.count == 0 {
            right.append(left.last!)
        }
        else if right.count > 0 && left.count == 0 {
            left.append(right.last!)
        }
        
        return (left, right)
    }
    
    func shouldLocateLeft(value: Element) -> Bool {
        let average = location[splitAxis]
        let compare = value[splitAxis]
        if compare < average {
            return true
        }
        return false
    }
}


extension KDNode {
    
    func insert(value: Element) {
        
        if isLeaf {
            setChildren([location, value])
            return
        }
        
        if shouldLocateLeft(value) {
            left?.insert(value)
        } else {
            right?.insert(value)
        }
    }
    
    func remove(value: Element) {
        
        if isLeaf && value == location {
            parent?.removeChildLeafNode(self)
            return
        }
        
        if shouldLocateLeft(value) {
            left?.remove(value)
        } else {
            right?.remove(value)
        }
    }
    
    func removeChildLeafNode(node: KDNode) {
        
        if !node.isLeaf {
            return
        }
        
        var replacementNode: KDNode?
        if node == left {
            replacementNode = right
        } else if node == right {
            replacementNode = left
        }
        
        if isLeft {
            parent?.left = replacementNode
        } else {
            parent?.right = replacementNode
        }
    }
}

extension KDNode: Equatable { }

public func ==<Element: LocationValue, T: BoundingValues>(lhs: KDNode<Element, T>, rhs: KDNode<Element, T>) -> Bool {
    if lhs === rhs {
        return true
    }
    return lhs.depth == rhs.depth && lhs.location == rhs.location && lhs.left == rhs.left && lhs.right == rhs.right
}


extension KDNode {
    
    func isAncestor(node: KDNode) -> Bool {
        if node.depth > depth || isLeaf {
            return false
        }
        
        return left == node || right == node || left?.isAncestor(node) == true || right?.isAncestor(node) == true
    }
    
    func isDescendant(node: KDNode) -> Bool {
        return node.isAncestor(self)
    }
}



extension KDNode {
    
    func forEachLeaf(@noescape each: (leaf: KDNode) -> Void) {
        
        left?.forEachLeaf(each)
        if isLeaf {
            each(leaf: self)
        }
        right?.forEachLeaf(each)
    }
}

