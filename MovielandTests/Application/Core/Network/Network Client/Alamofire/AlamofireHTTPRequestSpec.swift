//
//  AlamofireHTTPRequestSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class AlamofireHTTPRequestSpec: QuickSpec {
    
    override func spec() {
        
        describe("AlamofireHTTPRequest") {
            
            let url = NSURL(string: "http://nshipster.com/")!
            
            it("should add the correct parameters to the request") {
                let request = AlamofireHTTPRequest(httpRequestMethod: .GET, url: url).parameters(["xcode": "sucks"])
                
                let expectedValue = request.parameters["xcode"] as! String
                
                expect(expectedValue).to(equal("sucks"))
            }
            
            it("should add multiple parameters to the request while chaining request") {
                let request = AlamofireHTTPRequest(httpRequestMethod: .GET, url: url).parameters(["xcode": "sucks"]).parameters(["sweet": "sugar"])
                
                let expectedValue1 = request.parameters["xcode"] as! String
                let expectedValue2 = request.parameters["sweet"] as! String
                
                expect(expectedValue1).to(equal("sucks"))
                expect(expectedValue2).to(equal("sugar"))
            }
            
            it("should add the correct headers to the request") {
                let request = AlamofireHTTPRequest(httpRequestMethod: .GET, url: url).headers(["break": "free"])
                
                let expectedValue = request.headers["break"]
                
                expect(expectedValue).to(equal("free"))
            }
            
            it("should add multiple headers to the request while chaining request") {
                let request = AlamofireHTTPRequest(httpRequestMethod: .GET, url: url).headers(["xcode": "sucks"]).headers(["sweet": "sugar"])
                
                let expectedValue1 = request.headers["xcode"]
                let expectedValue2 = request.headers["sweet"]
       
                expect(expectedValue1).to(equal("sucks"))
                expect(expectedValue2).to(equal("sugar"))
            }
            
            it("should add the correct body to the request") {
                let body = "Runaway".dataUsingEncoding(NSUTF8StringEncoding)
                
                let request = AlamofireHTTPRequest(httpRequestMethod: .GET, url: url).body(body)
                
                expect(request.body).notTo(beNil())
            }
        }
    }
}