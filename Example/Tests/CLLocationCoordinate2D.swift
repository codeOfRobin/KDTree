//
//  File.swift
//  KDTree
//
//  Created by Adam J Share on 4/20/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

extension CLLocationCoordinate2D: LocationValue {
    
    public var valueArray: [Double] {
        return [self.longitude, self.latitude];
    }
    
    public static func fromValueArray(array: [Double]) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: array[1], longitude: array[0])
    }
}
