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
	
	/** The value of the property. (I might eventually want to make this an optional..nil-messaging r00lz) */
	var value: Any
	
	
	init(key: String, value: Any) {
		self.key = key
		self.value = value
	}
}