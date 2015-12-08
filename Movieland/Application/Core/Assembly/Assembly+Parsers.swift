//
//  Assembly+Parsers.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBMovieMediaServiceSearchApiParser() -> Parseable {
        return TMDBMovieMediaServiceSearchApiParser()
    }
}