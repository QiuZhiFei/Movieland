//
//  TestEnviromentDetector.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

/**
 Detect if current app is being executed on a test environment
 
 @Source: http://www.objc.io/issue-1/testing-view-controllers.html
 */
func applicationIsRunningTests(enviroment: [String: String]) -> Bool {
    let injectedBundle = enviroment["XCInjectBundle"]
    
    guard let bundlePath = injectedBundle else {
        return false
    }
    
    return bundlePath.hasSuffix("xctest")
}