//
//  TMDBMovieMediaServiceSpokenLanguageApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct JSONKeys {
    static let iso_639_1 = "iso_639_1"
    static let name = "name"
}

struct TMDBMovieMediaServiceSpokenLanguageApiParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        
        let json = JSON(element)
        
        let iso_639_1 = json[JSONKeys.iso_639_1].stringValue
        let name = json[JSONKeys.name].stringValue
        
        return TMDBMovieSpokenLanguageApiModel(
            iso_639_1: iso_639_1,
            name: name
        ) as! T
    }
}