//
//  EntityActionInput.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** An input is a parameter to an action (method). */
class EntityActionInput: Copyable {
	
	/** The title of this input. */
	let title: String
	
	/** The singular form of the unit this input is measured in. */
	let unit: String?
	
	/** A pluralized version of the unit. */
	var pluralUnit: String? {
		if let unit = self.unit {
			if let valueAsInt = self.valueAsInt {
				return unit + (valueAsInt == 1 ? "" : "s")
			}
			
		}
		return self.unit
	}
	
	
	/** The value of the input. */
	var value: Any
	
	
	private var valueAsInt: Int? {
		if self.value is Int {
			return Int(self.value as Int)
		}
		
		return nil
	}
	
	init(title: String, unit: String?, defaultValue: Any) {
		self.title = title
		self.unit = unit
		self.value = defaultValue
	}
	
	
	func copy() -> Any {
		return EntityActionInput(title: self.title, unit: self.unit, defaultValue: self.value)
	}
}