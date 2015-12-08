//
//  AlamofireHTTPRequestBuilderSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class AlamofireHTTPRequestBuilderSpec: QuickSpec {
    
    override func spec() {
        
        describe("AlamofireHTTPRequestBuilder") {
            
            let sut = AlamofireHTTPRequestBuilder()
            let url = NSURL(string: "http://thecodinglove.com/")! // If you don't know this web please take 5 min and open it, it's all ❤️
            
            context("when building a request") {
                
                it("generate a GET request") {
                    let request = sut.build(with: .GET, url: url)
                    
                    expect(HTTPRequestMethod.GET).to(equal(request.httpRequestMethod))
                }
                
                it("generate a POST request") {
                    let request = sut.build(with: .POST, url: url)
                    
                    expect(HTTPRequestMethod.POST).to(equal(request.httpRequestMethod))
                }
                
                it("generate a PUT request") {
                    let request = sut.build(with: .PUT, url: url)
                    
                    expect(HTTPRequestMethod.PUT).to(equal(request.httpRequestMethod))
                }
                
                it("generate a PATCH request") {
                    let request = sut.build(with: .PATCH, url: url)
                    
                    expect(HTTPRequestMethod.PATCH).to(equal(request.httpRequestMethod))
                }
                
                it("generate a DELETE request") {
                    let request = sut.build(with: .DELETE, url: url)
                    
                    expect(HTTPRequestMethod.DELETE).to(equal(request.httpRequestMethod))
                }
            }
            
            context("when building the url request") {
                
                it("should add the correct headers to the request") {
                    let request = sut.generateURLRequest(
                        .GET,
                        url: url,
                        parameters: [:],
                        headers: ["papi": "chulo"],
                        body: nil
                    )
                    
                    let expectedValue = request.valueForHTTPHeaderField("papi")
                    
                    expect(expectedValue).to(equal("chulo"))
                }
                
                it("should add the correct parameters to the request") {
                    let request = sut.generateURLRequest(
                        .GET,
                        url: url,
                        parameters: ["ritmo": "caliente"],
                        headers: [:],
                        body: nil
                    )
                    
                    let expectedValue = "?ritmo=caliente"
                    
                    expect(request.URL!.absoluteString).to(endWith(expectedValue))
                }
                
                it("should add the correct body data to the request") {
                    let body = "🔥".dataUsingEncoding(NSUTF8StringEncoding)
                    
                    let request = sut.generateURLRequest(
                        .GET,
                        url: url,
                        parameters: [:],
                        headers: [:],
                        body: body
                    )
                    
                    expect(request.HTTPBody).to(equal(body))
                }
                
                it("should add the correct http method to the request") {
                    
                    let request = sut.generateURLRequest(
                        .PATCH,
                        url: url,
                        parameters: [:],
                        headers: [:],
                        body: nil
                    )
                    
                    expect(request.HTTPMethod).to(equal(HTTPRequestMethod.PATCH.rawValue))
                }
            }
        }
    }
}