//
//  Dictionary+Extended.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func union(dictionary: Dictionary) -> Dictionary {
        return self.reduce(dictionary) { (var d, p) in d[p.0] = p.1
            return d
        }
    }
}