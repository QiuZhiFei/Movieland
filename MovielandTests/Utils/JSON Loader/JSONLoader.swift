//
//  JSONLoader.swift
//  Movieland
//
//  Created by Oscar Duran on 16/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

class JSONLoader {
    
    /**
     Loads a JSON fixture from the test bundle
     
     - parameter filePath: file path for the json fil
     
     - returns: the return json value
     */
    static func fixture<T>(filePath: String) -> T {
        let bundle = NSBundle(forClass:object_getClass(self))
        let jsonFile = bundle.pathForResource(filePath, ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments)
            return json as! T
        } catch {}
        
        return ["": ""] as! T
    }
}