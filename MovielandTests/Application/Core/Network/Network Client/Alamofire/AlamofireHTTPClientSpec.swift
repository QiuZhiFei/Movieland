//
//  AlamofireHTTPClientSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class AlamofireHTTPClientSpec: QuickSpec {
    
    override func spec() {
        
        describe("AlamofireHTTPClient") {
            
            let baseURL = "https://www.objc.io/"
            
            context("when building the request") {
                
                var sut: HTTPClient?
                var requestBuilder: HTTPRequestBuilderMock?
                
                beforeEach {
                    requestBuilder = HTTPRequestBuilderMock()
                    sut = AlamofireHTTPClient(
                        baseURL: baseURL,
                        requestBuilder: requestBuilder!
                    )
                }
                
                afterEach {
                    sut = nil
                    requestBuilder = nil
                }
                
                it("generates a GET request") {
                    let request = sut!.GET("path")
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.GET))
                    expect(request.url.path!).to(equal("/path"))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a GET request with parameters") {
                    
                    let parameters = ["param1": true]
                    let request = sut!.GET("path").parameters(parameters)
                    
                    let expectedValue = request.parameters["param1"] as! Bool
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.GET))
                    expect(request.url.path!).to(equal("/path"))
                    expect(expectedValue).to(equal(true))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a POST request") {
                    let request = sut!.POST("path")
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.POST))
                    expect(request.url.path!).to(equal("/path"))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a POST request with body") {
                    let body = "Stay".dataUsingEncoding(NSUTF8StringEncoding)!
                    let request = sut!.POST("path").body(body)
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.POST))
                    expect(request.url.path!).to(equal("/path"))
                    expect(request.body!).to(equal(body))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a PUT request") {
                    let request = sut!.PUT("path")
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.PUT))
                    expect(request.url.path!).to(equal("/path"))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a PATCH request") {
                    let request = sut!.PATCH("path")
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.PATCH))
                    expect(request.url.path!).to(equal("/path"))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
                
                it("generates a DELETE request") {
                    let request = sut!.DELETE("path")
                    
                    expect(request.httpRequestMethod).to(equal(HTTPRequestMethod.DELETE))
                    expect(request.url.path!).to(equal("/path"))
                    expect(requestBuilder!.buildExecuted).toEventually(beTruthy())
                }
            }
            
            context("when executing the request") {
                
                let requestBuilder = HTTPRequestBuilderMock()
                let sut = AlamofireHTTPClient(
                    baseURL: baseURL,
                    requestBuilder: requestBuilder
                )
                let request = sut.GET("path")
                
                it("should generate the url request when executing") {
                    sut.execute(request, result: { (result) in })
                    
                    expect(requestBuilder.generateURLRequestExecuted).toEventually(beTruthy())
                }
                
                context("should execute all the processors") {
                    
                    it("should execute the request processors when executing") {
                        let requestProcessorMock = HTTPRequestProcessorMock()
                        
                        sut.requestProcessors = [requestProcessorMock]
                        
                        sut.execute(request, result: { (result) in })
                        
                        expect(requestProcessorMock.processRequestExecuted).toEventually(beTruthy())
                    }
                    
                    pending("should execute the response processors when the request finishes") {
                        let responseProcessorMock = HTTPResponseProcessorMock()
                        
                        sut.responseProcessors = [responseProcessorMock]
                        
                        sut.execute(request, result: { (result) in })
                        
                        expect(responseProcessorMock.processResponseExecuted).toEventually(beTruthy())
                    }
                    
                    pending("should execute the error processors when the request failed") {
                        let errorProcessorMock = HTTPErrorProcessorMock()
                        
                        sut.responseErrorProcessor = errorProcessorMock
                        
                        sut.execute(request, result: { (result) in })
                        
                        expect(errorProcessorMock.processErrorExecuted).toEventually(beTruthy())
                    }
                }
            }
        }
    }
}


// MARK: - Mocks

class HTTPRequestBuilderMock: HTTPRequestBuilder {
    
    var buildExecuted = false
    var generateURLRequestExecuted = false
    
    func build(with method: HTTPRequestMethod, url: NSURL) -> HTTPRequest {
        buildExecuted = true
        return AlamofireHTTPRequest(httpRequestMethod: method, url: url)
    }
    
    func generateURLRequest(method: HTTPRequestMethod, url: NSURL, parameters: [String : AnyObject], headers: [String : String], body: NSData?) -> NSURLRequest {
        generateURLRequestExecuted = true
        return NSURLRequest()
    }
}

class HTTPRequestProcessorMock: HTTPRequestProcessor {
    
    var processRequestExecuted = false
    
    func processRequest(request: HTTPRequest) -> HTTPRequest {
        processRequestExecuted = true
        return request
    }
}

class HTTPResponseProcessorMock: HTTPResponseProcessor {
    
    var processResponseExecuted = false
    
    func processResponse(response: HTTPResponse) -> HTTPResponse {
        processResponseExecuted = true
        return response
    }
}

class HTTPErrorProcessorMock: HTTPErrorProcessor {
    
    var processErrorExecuted = false
    
    func processError(request: HTTPRequest, response: HTTPResponse) -> NSError {
        processErrorExecuted = true
        return NSError(
            domain: "es.skydev.Movieland",
            code: -1,
            userInfo: nil
        )
    }
}