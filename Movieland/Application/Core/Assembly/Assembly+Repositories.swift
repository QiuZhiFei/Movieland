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
            searchDataSourceProvider: self,
            getMovieByIdDataSourceProvider: self
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

// MARK: - TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider

extension Assembly: TMDBMovieMediaServiceGetMovieByIdApiDataSourceProvider {
    
    func dataSource() -> TMDBMovieMediaServiceGetMovieByIdApiDataSource {
        return TMDBMovieMediaServiceGetMovieByIdApiDataSource(
            httpClient: getTMDBHttpClient(),
            parser: getTMDBMovieMediaServiceMovieApiParser(),
            mapper: getTMDBMovieMediaServiceMovieApiToDomainMapper()
        )
    }
}