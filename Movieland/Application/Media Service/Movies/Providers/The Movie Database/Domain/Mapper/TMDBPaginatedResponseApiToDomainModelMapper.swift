//
//  TMDBPaginatedResponseApiToDomainModelMapper.swift
//  Movieland
//
//  Created by Oscar Duran on 19/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol TMDBPaginatedResponseApiToDomainModelMapperProvider {
    func mapper(with items:[MovieSearchResult]) -> Mappable
}

struct TMDBPaginatedResponseApiToDomainModelMapper: Mappable {
    
    let items: [MovieSearchResult]
    
    init(items: [MovieSearchResult]) {
        self.items = items
    }
    
    func mapObject<F, T>(from objectToMap: F) -> T {
        
        let from = objectToMap as! TMDBPaginatedResponseApiModel
        
        let hasNextPage = from.page != from.totalPages

        return PaginatedResponse<MovieSearchResult>(
            currentPage: from.page,
            hasNextPage: hasNextPage,
            totalPages: from.totalPages,
            totalResults: from.totalResults,
            items: items
        ) as! T
    }
}