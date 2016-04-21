//
//  MKMapRect.swift
//  KDTree
//
//  Created by Adam J Share on 4/20/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

extension MKMapRect: BoundingValues {
    
    public init<Element : LocationValue>(values: [Element]) {
        var minimum: MKMapPoint = MKMapPoint(x: Double.infinity, y: Double.infinity)
        var maximum: MKMapPoint = MKMapPoint(x: -Double.infinity, y: -Double.infinity)
        
        for value in values {
            var mapPoint: MKMapPoint!
            if let coordinate = value as? CLLocationCoordinate2D {
                mapPoint = MKMapPointForCoordinate(coordinate)
            }
            else if let point = value as? MKMapPoint {
                mapPoint = point
            }
            else {
                let valueArray = value.valueArray
                mapPoint = MKMapPoint(x: valueArray[0], y: valueArray[1])
            }
            
            minimum.x = min(mapPoint.x, minimum.x)
            minimum.y = min(mapPoint.y, minimum.y)
            
            maximum.x = max(mapPoint.x, maximum.x)
            maximum.y = max(mapPoint.y, maximum.y)
        }
        
        origin = minimum
        size = MKMapSize(width: fabs(minimum.x-maximum.x), height: fabs(minimum.y-maximum.y))
    }
    
    public func containsValue<Element : LocationValue>(value: Element) -> Bool {
        if let value = value as? CLLocationCoordinate2D {
            return MKMapRectContainsPoint(self, MKMapPointForCoordinate(value))
        }
        return false
    }
    
    public func intersects(boundingValues: MKMapRect) -> Bool {
        
        return MKMapRectIntersectsRect(self, boundingValues)
    }
    
    public func isEqualTo(boundingValues: MKMapRect) -> Bool {
        return MKMapPointEqualToPoint(origin, boundingValues.origin) && MKMapSizeEqualToSize(size, boundingValues.size)
    }
}