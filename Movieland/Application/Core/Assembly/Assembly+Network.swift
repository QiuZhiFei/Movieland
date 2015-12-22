//
//  Assembly+Network.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

// MARK: - The Movie Data Base

extension Assembly {
    
    func getTMDBHttpClient() -> HTTPClient {
        let httpClient = AlamofireHTTPClient(
            baseURL: TMDBMovieMediaServiceApiDefinition.ApiBaseUrl.path,
            requestBuilder: getHttpRequestBuilder()
        )
        httpClient.requestProcessors = [
            getTMDBRequestProcessor()
        ]
        
        return Locate(httpClient, key: "TMDBHttpClient")
    }
    
    func getTMDBRequestProcessor() -> HTTPRequestProcessor {
        return TMDBRequestProcessor()
    }
}


// MARK: - Common 

extension Assembly {

    func getHttpRequestBuilder() -> HTTPRequestBuilder {
        return AlamofireHTTPRequestBuilder()
    }
}