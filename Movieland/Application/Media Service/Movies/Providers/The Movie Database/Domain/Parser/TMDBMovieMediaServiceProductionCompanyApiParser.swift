//
//  TMDBMovieMediaServiceProductionCompanyApiParser.swift
//  Movieland
//
//  Created by Oscar Duran on 14/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import SwiftyJSON

private struct JSONKeys {
    static let id = "id"
    static let name = "name"
}

struct TMDBMovieMediaServiceProductionCompanyApiParser: Parseable {
    
    func parse<T where T : Model>(element: [String : AnyObject]) -> T {
        
        let json = JSON(element)
        
        let id = json[JSONKeys.id].stringValue
        let name = json[JSONKeys.name].stringValue
        
        return TMDBMovieProductionCompanyApiModel(
            id: id,
            name: name
        ) as! T
    }
}