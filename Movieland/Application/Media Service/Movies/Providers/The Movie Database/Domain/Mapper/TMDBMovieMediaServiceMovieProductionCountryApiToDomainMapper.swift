//
//  TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 15/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceMovieProductionCountryApiToDomainMapper: Mappable {
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBMovieProductionCountryApiModel
        
        return MovieProductionCountry(
            iso_3166_1: from.iso_3166_1,
            name: from.name
        ) as! T
    }
}