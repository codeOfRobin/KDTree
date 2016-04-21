//
//  LocationValue.swift
//  Pods
//
//  Created by Adam J Share on 4/20/16.
//
//

import Foundation


public protocol LocationValue: Equatable {
    
    var valueArray: [Double] { get }
    static func fromValueArray(array: [Double]) -> Self
}

public func ==<T : LocationValue>(lhs: T, rhs: T) -> Bool {
    return lhs.valueArray == rhs.valueArray
}

