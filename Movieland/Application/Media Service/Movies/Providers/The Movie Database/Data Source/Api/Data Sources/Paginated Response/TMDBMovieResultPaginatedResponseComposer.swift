//
//  TMDBPaginatedResponseComposer.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

struct TMDBMovieResultPaginatedResponseComposer {
    
    let parser: Parseable
    let mapperProvider: TMDBPaginatedResponseApiToDomainModelMapperProvider
    
    init(parser: Parseable, mapperProvider: TMDBPaginatedResponseApiToDomainModelMapperProvider) {
        self.parser = parser
        self.mapperProvider = mapperProvider
    }
    
    func paginate(response: HTTPResponse, items: [MovieSearchResult]) -> PaginatedResponse<MovieSearchResult> {
        
        let paginatedResponseApiModel: TMDBPaginatedResponseApiModel = parser.parse(response.json)
        let paginatedResponse: PaginatedResponse<MovieSearchResult> = mapperProvider.mapper(with: items).mapObject(from: paginatedResponseApiModel)
        
        return paginatedResponse
    }
}