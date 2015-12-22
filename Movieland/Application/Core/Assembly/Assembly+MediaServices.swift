//
//  Assembly+MediaServices.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBMovieMediaService() -> MovieMediaService {
        return TMDBMovieMediaService(
            repository: getTMDBMediaServiceRepository()
        )
    }
}