//
//  NSObject+Identifier.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

extension NSObject {
	
	class func reuseIdentifier() -> String {
		return NSStringFromClass(self)
	}
}