//
//  KDTree.swift
//  Pods
//
//  Created by Adam J Share on 4/8/16.
//
//

import Foundation
import MapKit


class KDTree<Element: LocationValue, T: BoundingValues> {
    typealias Node = KDNode<Element, T>

    var root: Node?
}


extension KDTree: Collection {
	
	/// Returns the position immediately after the given index.
	///
	/// - Parameter i: A valid index of the collection. `i` must be less than
	///   `endIndex`.
	/// - Returns: The index value immediately after `i`.
	public func index(after i: Int) -> Int {
		return i + 1
	}


    var startIndex: Int {
        return 0
    }

    var endIndex: Int {
        return 0
    }

    subscript (i: Int) -> Node? {

        return nil
    }
//    public typealias Index = Int
//
//    typealias Generator = AnyGenerator<Node>
//
//    func generate() -> Generator {
//        var index = 0
//        return AnyGenerator {
//            return nil
//        }
//    }
}
