//
//  DefaultServiceLocator.swift
//  Movieland
//
//  Created by Oscar Duran on 1/12/15.
//  Copyright © 2015 Skydev. All rights reserved.
//

import Foundation

class DefaultServiceLocator: ServiceLocator {
    static let locator = DefaultServiceLocator()
    
    private var serviceLocatorInstances = [String: AnyObject]()
    
    private init() {}
    
    func register(key: String, instance: AnyObject) {
        serviceLocatorInstances[key] = instance
    }
    
    func get(key: String) -> AnyObject? {
        guard let instance = serviceLocatorInstances[key] else {
            return nil
        }
        return instance
    }
    
    func remove(key: String) {
        serviceLocatorInstances.removeValueForKey(key)
    }
    
    func removeAll() {
        serviceLocatorInstances.removeAll()
    }
}


/**
 Locate and save an object instance, it's like an handy way of making singletons and keep the instance alive
 
 - parameter service: service instance to register/locate
 - parameter key:     an key identifier
 
 - returns: returns a cached instance of the service
 */
func Locate<T where T: AnyObject>(service: T, key: String) -> T {
    guard let serviceToLocate = DefaultServiceLocator.locator.get(key) else {
        DefaultServiceLocator.locator.register(key, instance: service)
        return service
    }
    return serviceToLocate as! T
}
