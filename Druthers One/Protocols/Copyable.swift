//
//  Copyable.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-03-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

protocol Copyable {
	
	/** Returns a copy of the receiver. */
	func copy() -> Any
}