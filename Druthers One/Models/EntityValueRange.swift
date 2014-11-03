//
//  EntityValueRange.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-03-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

/** Represents a range limiting for an entity value. */
struct EntityValueRange {
	
	/** The range over which the value can vary. */
	let range: Range<Int>
	
	/** Controls if the value wraps when it reaches its lower or upper bound. If true, the value wraps around to the other limit (e.g., a range of 0..100 and a value of 105 would wrap around to 0). */
	let wraps: Bool
	
	
	/** Returns a value in range, either wrapped or clamped to the range. */
	func rangedValueForIntValue(value: Any) -> Any {
		if value is Int {
			if self.wraps {
				return self.wrappedRangedValueForIntValue(value as Int)
			}
			
			return self.clampedRangedValueForIntValue(value as Int)
		}
		
		return value
	}
	
	
	private func wrappedRangedValueForIntValue(intValue: Int) -> Int {
		var value = intValue
		if value < self.range.startIndex {
			value = self.range.endIndex - (self.range.startIndex - value)
		}
		
		if value > self.range.endIndex {
			value = self.range.startIndex + (value - self.range.endIndex)
		}
		
		return value
	}
	
	
	private func clampedRangedValueForIntValue(intValue: Int) -> Int {
		var value = intValue
		if value < self.range.startIndex {
			value = self.range.startIndex
		}
		
		if value > self.range.endIndex {
			value = self.range.endIndex
		}
		
		return value
	}
}