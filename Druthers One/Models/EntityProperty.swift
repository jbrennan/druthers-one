//
//  EntityProperty.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** A property for an Entity. */
class EntityProperty {
	
	/** The key (name) of the property. */
	let key: String
	
	/** The value of the property. Generally you should use the -evaluate() method to get a value, but this property is useful if you care what the property value was explicitly set to. */
	var value: Any {
		return internalValue
	}
	
	/** The range the value is clamped to. */
	var range: Range<Int>?
	
	private var internalValue: Any
	
	init(key: String, value: Any, range: Range<Int>? = nil) {
		self.key = key
		self.internalValue = value
		self.range = range
	}
	
	func updateValueTo(newValue: Any) {
		// TODO: Clamp if needed
		self.internalValue = newValue
	}
	
	/** Evaluates the property and returns a value. */
	func evaluate() -> Any {
		return self.value
	}
}