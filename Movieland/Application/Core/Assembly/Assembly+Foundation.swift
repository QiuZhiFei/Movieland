//
//  Assembly+Foundation.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getDateFormatter() -> NSDateFormatter {
        return Locate(
            NSDateFormatter(),
            key: "dateFormatter"
        )
    }
}