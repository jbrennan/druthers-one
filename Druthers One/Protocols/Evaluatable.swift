//
//  Evaluatable.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-05-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** Types conforming to this protocol can be evaluated at runtime. */
protocol Evaluatable {
	
	/** Evaluate and return a value. Typically these are Int values but they can theoretically be anything. */
	func evaluate() -> Any
}