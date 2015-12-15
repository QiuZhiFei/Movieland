//
//  TMDBMovieMediaServiceProductionCountryApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct JSONKeys {
    static let iso_3166_1 = "iso_3166_1"
    static let name = "name"
}

struct TMDBMovieMediaServiceProductionCountryApiParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        
        let json = JSON(element)
        
        let iso_3166_1 = json[JSONKeys.iso_3166_1].stringValue
        let name = json[JSONKeys.name].stringValue
        
        return TMDBMovieProductionCountryApiModel(
            iso_3166_1: iso_3166_1,
            name: name
        ) as! T
    }
}