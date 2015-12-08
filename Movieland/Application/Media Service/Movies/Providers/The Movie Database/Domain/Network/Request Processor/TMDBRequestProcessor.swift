//
//  TMDBRequestProcessor.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

private struct Parameters {
    static let apiKey = "api_key"
}

struct TMDBRequestProcessor: HTTPRequestProcessor {
    
    func processRequest(request: HTTPRequest) -> HTTPRequest {
        return request.parameters([
            Parameters.apiKey: ""
        ])
    }
}