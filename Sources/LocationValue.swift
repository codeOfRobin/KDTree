//
//  LocationValue.swift
//  Pods
//
//  Created by Adam J Share on 4/20/16.
//
//

import Foundation


public protocol LocationValue: Equatable, Collection {
    init()
}

public func ==<T : LocationValue>(lhs: T, rhs: T) -> Bool {
    for i in [Int](lhs.indices.lowerBound..<lhs.indices.upperBound) {
        if lhs[i] != rhs[i] {
            return false
        }
    }
    return true
}

extension LocationValue {
    
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return 0
    }
    
    public var indices: Range<Int> {
        return startIndex..<endIndex
    }
	
	public var indicesArray: [Int] {
		return [Int](startIndex..<endIndex)
	}
    
    public subscript(i: Int) -> Double? {
        set {
            
        }
        get {
            return nil
        }
    }
}
