//
//  File.swift
//  KDTree
//
//  Created by Adam J Share on 4/20/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import KDTree
import CoreLocation

extension CLLocationCoordinate2D: LocationValue {
//    public typealias Generator = AnyGenerator<Double>
    
    public var valueArray: [Double] {
        return [self.longitude, self.latitude];
    }
    
    public static func fromValueArray(array: [Double]) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: array[1], longitude: array[0])
    }
}


// MARK: CollectionType
extension CLLocationCoordinate2D {
    
    public typealias Index = Int
    
    public var startIndex: Index {
        return 0
    }
    
    public var endIndex: Index {
        return 2
    }
    
    public subscript(i: Index) -> Double {
        set {
            if i == 0 {
                longitude = newValue
            } else if i == 1 {
                latitude = newValue
            }
        }
        get {
            if i == 0 {
                return self.longitude
            } else if i == 1 {
                return self.latitude
            }
            return 0
        }
    }
}

public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}


