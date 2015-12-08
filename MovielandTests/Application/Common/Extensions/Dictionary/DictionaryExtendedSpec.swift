//
//  DictionaryExtendedSpec.swift
//  Movieland
//
//  Created by Oscar Duran on 8/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//
 
import Quick
import Nimble

@testable import Movieland

class DictionaryExtendedSpec: QuickSpec {
    
    override func spec() {
        
        describe("DictionaryExtended") {
            
            it("should combine two different dictionaries") {
                
                let dictionary1 = ["mama": "mia"]
                let dictionary2 = ["harry": "potter"]
                let combinedDictionary = dictionary1.union(dictionary2)
                
                let expectedValue1 = combinedDictionary["mama"]
                let expectedValue2 = combinedDictionary["harry"]

                expect(expectedValue1).to(equal("mia"))
                expect(expectedValue2).to(equal("potter"))
            }
        }
    }
}