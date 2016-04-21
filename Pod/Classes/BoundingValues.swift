//
//  BoundingValues.swift
//  Pods
//
//  Created by Adam J Share on 4/20/16.
//
//

import Foundation

public protocol BoundingValues: Equatable {
    
    func containsValue<Element: LocationValue>(value: Element) -> Bool
    func intersects(boundingValues: Self) -> Bool
    func isEqualTo(boundingValues: Self) -> Bool
    
    init<Element: LocationValue>(values: [Element])
}

public func ==<T: BoundingValues>(lhs: T, rhs: T) -> Bool {
    return lhs.isEqualTo(rhs)
}
