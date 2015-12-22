//
//  AppDelegate.swift
//  Movieland
//
//  Created by Oscar Duran on 1/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if applicationIsRunningTests(NSProcessInfo.processInfo().environment) { return false }
 
        return true
    }
}

