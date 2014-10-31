//
//  NSNotificationCenter+Convenience.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

/** Man I really want to write my own NSNC to get around this "removeObserver" business...*/
extension NSNotificationCenter {
	
	class func postNotificationNamed(name: String, object: AnyObject? = nil, userInfo: [NSObject: AnyObject]? = nil) {
		let center = self.defaultCenter()
		center.postNotificationName(name, object: object, userInfo: userInfo)
	}
	
	
	class func addObserver(observer: AnyObject, notificationName: String, selector: Selector) {
		let center = self.defaultCenter()
		center.addObserver(observer, selector: selector, name: notificationName, object: nil)
	}
	
	
	class func removeObserver(observer: AnyObject) {
		let center = self.defaultCenter()
		center.removeObserver(observer)
	}
}