//
//  TestEnviromentDetectorSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class TestEnviromentDetectorSpec: QuickSpec {
    
    override func spec() {
        
        describe("TestEnviromentDetector") {
            
            it("should return true when we are on a valid test environment") {
                let testEnvironmentInput = ["XCInjectBundle" : "/SomePath/Infojobs.xctest"]
                
                let isRunningOnTestEnviroment = applicationIsRunningTests(testEnvironmentInput)
                
                expect(isRunningOnTestEnviroment).to(beTruthy())
            }
            
            it("should return false when we are not on a valid test environment") {
                let invalidTestEnvironmentInput = ["💯": "🆒"]
                
                let isRunningOnTestEnviroment = applicationIsRunningTests(invalidTestEnvironmentInput)
                
                expect(isRunningOnTestEnviroment).to(beFalsy())
            }
        }
    }
}