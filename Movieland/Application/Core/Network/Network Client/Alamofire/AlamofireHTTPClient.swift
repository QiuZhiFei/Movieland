//
//  AlamofireHTTPClient.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Alamofire
import Result

class AlamofireHTTPClient: HTTPClient {
    
    var requestProcessors: [HTTPRequestProcessor] = []
    var responseProcessors: [HTTPResponseProcessor] = []
    var responseErrorProcessor: HTTPErrorProcessor?
    
    var baseURL: NSURL?
    let requestBuilder: HTTPRequestBuilder
    
    required init(baseURL: String, requestBuilder: HTTPRequestBuilder) {
        self.baseURL = NSURL(string: baseURL)
        self.requestBuilder = requestBuilder
    }
    
    func GET(path: String) -> HTTPRequest {
        return requestBuilder.build(with: .GET, url: buildURL(path))
    }
    
    func POST(path: String) -> HTTPRequest {
        return requestBuilder.build(with: .POST, url: buildURL(path))
    }
    
    func PUT(path: String) -> HTTPRequest {
        return requestBuilder.build(with: .PUT, url: buildURL(path))
    }
    
    func PATCH(path: String) -> HTTPRequest {
        return requestBuilder.build(with: .PATCH, url: buildURL(path))
    }
    
    func DELETE(path: String) -> HTTPRequest {
        return requestBuilder.build(with: .DELETE, url: buildURL(path))
    }
    
    func execute(request: HTTPRequest, result: HTTPResult) {
        var requestToExecute = request
        
        for requestProcessor in requestProcessors {
            requestToExecute = requestProcessor.processRequest(request)
        }
        
        let urlRequest = requestBuilder.generateURLRequest(
            requestToExecute.httpRequestMethod,
            url: requestToExecute.url,
            parameters: requestToExecute.parameters,
            headers: requestToExecute.headers,
            body: requestToExecute.body
        )
        
        Alamofire.request(urlRequest)
            .validate()
            .response(completionHandler: { (request, response, data, error) in
                
                var httpResponse: HTTPResponse
                
                if let data = data  {
                    
                    var json: [String: AnyObject]
                    
                    do {
                        json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! [String : AnyObject]
                    } catch {
                        json = [:]
                    }
                    
                    httpResponse = HTTPResponse(
                        urlRequest: request,
                        httpUrlResponse: response,
                        data: data,
                        error: error,
                        json: json
                    )
                    
                } else {
                    
                    httpResponse = HTTPResponse(
                        urlRequest: request,
                        httpUrlResponse: response,
                        data: data,
                        error: error,
                        json: [:]
                    )
                }
                self.processRequest(requestToExecute, response: httpResponse, result: result)
            })
    }
    
    private func processRequest(request: HTTPRequest, response: HTTPResponse, result: HTTPResult) {
        guard let error = response.error else {
            
            var responseToProcess = response
            
            for responseProcessor in responseProcessors {
                responseToProcess = responseProcessor.processResponse(responseToProcess)
            }
            
            result(
                Result.Success(responseToProcess)
            )
            return
        }
        
        var responseError = error
        
        if let errorProcessor = responseErrorProcessor {
            responseError = errorProcessor.processError(request, response: response)
        }
        
        result(
            Result.Failure(responseError)
        )
    }
    
    private func buildURL(path: String) -> NSURL {
        guard let baseURL = baseURL else {
            assertionFailure("baseURL can't be empty, please check you url before executing any request")
            return NSURL(string: "")!
        }
        return baseURL.URLByAppendingPathComponent(path)
    }
}