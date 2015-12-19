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
            getMovieByIdDataSourceProvider: self,
            getMoviesByModeDataSourceProvider: self
        )
    }
}

// MARK: - TMDBMovieMediaServiceSearchApiDataSourceProvider

extension Assembly: TMDBMovieMediaServiceSearchApiDataSourceProvider {
    
    func dataSource() -> TMDBMovieMediaServiceSearchApiDataSource {
        return TMDBMovieMediaServiceSearchApiDataSource(
            httpClient: getTMDBHttpClient(),
            parser: getTMDBMovieMediaServiceSearchApiParser(),
            mapper: getTMDBMovieMediaServiceSearchApiToDomainMapper(),
            queryComposer: getTMDBRequestQueryComposer(),
            paginatedResponseComposer: getTMDBPaginatedResponseComposer()
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

// MARK: - TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider

extension Assembly: TMDBMovieMediaServiceGetMoviesByModeApiDataSourceProvider {
    
    func dataSource() -> TMDBMovieMediaServiceGetMoviesByModeApiDataSource {
        return TMDBMovieMediaServiceGetMoviesByModeApiDataSource(
            httpClient: getTMDBHttpClient(),
            parser: getTMDBMovieMediaServiceSearchApiParser(),
            mapper: getTMDBMovieMediaServiceSearchApiToDomainMapper(),
            queryComposer: getTMDBRequestQueryComposer(),
            paginatedResponseComposer: getTMDBPaginatedResponseComposer()
        )
    }
}

extension Assembly {
    
    func getTMDBRequestQueryComposer() -> RequestQueryComposer {
        return TMDBRequestQueryComposer()
    }
    
    func getTMDBPaginatedResponseComposer() -> TMDBMovieResultPaginatedResponseComposer {
        return TMDBMovieResultPaginatedResponseComposer(
            parser: getTMDBPaginatedResponseApiParser(),
            mapperProvider: self
        )
    }
}

// MARK: - TMDBPaginatedResponseApiToDomainModelMapperProvider

extension Assembly: TMDBPaginatedResponseApiToDomainModelMapperProvider {
    
    func mapper(with items: [MovieSearchResult]) -> Mappable {
        return TMDBPaginatedResponseApiToDomainModelMapper(
            items: items
        )
    }
}
