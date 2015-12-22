//
//  Keys.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation
import Keys

struct Keys {
    
    private static func Keys() -> MovielandKeys {
        return MovielandKeys()
    }
    
    static func theMovieDataBaseApiKey() -> String {
        return Keys().theMovieDataBaseApiKey()
    }
}