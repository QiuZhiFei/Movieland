//
//  TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 15/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieMediaServiceMovieSpokenLanguageApiToDomainMapper: Mappable {
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBMovieSpokenLanguageApiModel
        
        return MovieSpokenLanguage(
            iso_639_1: from.iso_639_1,
            name: from.name
        ) as! T
    }
}