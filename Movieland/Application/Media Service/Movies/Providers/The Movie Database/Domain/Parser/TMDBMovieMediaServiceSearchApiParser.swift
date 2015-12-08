//
//  TMDBMovieMediaServiceSearchApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceSearchApiParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        return "" as! T
    }
    
    func parseArray<T where T : Model>(elements: [String : AnyObject]) -> [T] {
        return []
    }
}