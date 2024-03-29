//
//  Assembly+Formatters.swift
//  Movieland
//
//  Created by Oscar Duran on 13/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

extension Assembly {
    
    func getTMDBDateFormatter() -> Formateable {
        return TMDBDateFormatter(
            dateFormatter: getDateFormatter()
        )
    }
}