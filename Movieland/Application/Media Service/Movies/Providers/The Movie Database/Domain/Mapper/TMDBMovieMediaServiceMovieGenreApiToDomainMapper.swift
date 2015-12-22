//
//  TMDBMovieMediaServiceMovieGenreApiToDomainMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 15/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceMovieGenreApiToDomainMapper: Mappable {
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBMovieGenreApiModel
        
        return MovieGenre(
            id: from.id,
            name: from.name
        ) as! T
    }
}