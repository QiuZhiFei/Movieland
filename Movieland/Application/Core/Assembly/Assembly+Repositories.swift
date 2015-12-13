//
//  Assembly+Repositories.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBMediaServiceRepository() -> MovieMediaService {
        return TMDBMovieMediaServiceRepository(
            searchDataSourceProvider: self
        )
    }
}

// MARK: - TMDBMovieMediaServiceSearchApiDataSourceProvider

extension Assembly: TMDBMovieMediaServiceSearchApiDataSourceProvider {
    
    func dataSource() -> TMDBMovieMediaServiceSearchApiDataSource {
        return TMDBMovieMediaServiceSearchApiDataSource(
            httpClient: getTMDBHttpClient(),
            parser: getTMDBMovieMediaServiceSearchApiParser(),
            mapper: getTMDBMovieMediaServiceSearchApiToDomainMapper()
        )
    }
}