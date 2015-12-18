//
//  RequestQueryComposer.swift
//  Movieland
//
//  Created by Oscar Duran on 18/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

protocol RequestQueryComposer {

    /**
     Compose query parameters into the request
     
     - parameter request:    request to modify
     - parameter parameters: parameters to add to the request
     
     - returns: a new HTTPRequest with the added parameters
     */
    func compose(request: HTTPRequest, parameters: QueryParameters?) -> HTTPRequest
}