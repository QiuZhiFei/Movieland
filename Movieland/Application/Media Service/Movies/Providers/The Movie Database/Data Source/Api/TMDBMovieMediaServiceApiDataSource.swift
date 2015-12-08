//
//  TMDBMovieMediaServiceApiDataSource.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Result

struct TMDBMovieMediaServiceApiDataSource: MovieMediaService {
    
    let httpClient: HTTPClient
    let parser: Parseable
    
    init(httpClient: HTTPClient, parser: Parseable) {
        self.httpClient = httpClient
        self.parser = parser
    }
    
    func search(query: String, searchResults: MovieMediaServiceSearchResult) {
        
        let path = TMDBMovieMediaServiceApiDefinition.Search(query: query).path
        let request = httpClient.GET(path)
        
        httpClient.execute(request) { (requestResult) in
            
            guard let response = requestResult.value else {
                searchResults(
                    Result.Failure(requestResult.error!)
                )
                return
            }
            
            print(response)
        }
    }
}