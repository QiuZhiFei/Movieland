//
//  TMDBRequestQueryComposer.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

private struct Parameters {
    static let page = "page"
}

struct TMDBRequestQueryComposer: RequestQueryComposer {
    
    func compose(request: HTTPRequest, parameters: QueryParameters?) -> HTTPRequest {
        
        if let parameters = parameters {
            return request.parameters([
                Parameters.page : parameters.pagination.page
            ])
        }
        
        return request
    }
}