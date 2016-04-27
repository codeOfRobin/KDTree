//
//  JSON.swift
//  KDTree
//
//  Created by Adam J Share on 4/25/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

func jsonFromFile(name: String) -> AnyObject {
    let jsonData = try! NSData(contentsOfFile: "name" + ".json", options: .DataReadingMappedIfSafe)
    let jsonDict = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
    print(jsonDict)
    return jsonDict
}

