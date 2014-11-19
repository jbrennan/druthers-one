//
//  EntityValueRange.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-03-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation
import CoreGraphics

/** Represents a range limiting for an entity value. */
struct EntityValueRange {
	
	/** The range over which the value can vary. */
	let range: Range<Int>
	
	/** Controls if the value wraps when it reaches its lower or upper bound. If true, the value wraps around to the other limit (e.g., a range of 0..100 and a value of 105 would wrap around to 0). */
	let wraps: Bool
	
	
	/** Returns a value in range, either wrapped or clamped to the range. */
	func rangedValueForFloatValue(value: Any) -> Any {
		if value is CGFloat {
			if self.wraps {
				return self.wrappedRangedValueForFloatValue(value as CGFloat)
			}
			
			return self.clampedRangedValueForFloatValue(value as CGFloat)
		}
		
		return value
	}
	
	
	// The following methods will potentially lose precision when wrapping. It's probably OK but ideally these could be made more precise. I'm just too lazy to do it right now.
	private func wrappedRangedValueForFloatValue(floatValue: CGFloat) -> CGFloat {
		var value = Int(floatValue)
		if value < self.range.startIndex {
			return CGFloat(self.range.endIndex - (self.range.startIndex - value))
		}
		
		if value > self.range.endIndex {
			return CGFloat(self.range.startIndex + (value - self.range.endIndex))
		}
		
		return floatValue
	}
	
	
	private func clampedRangedValueForFloatValue(floatValue: CGFloat) -> CGFloat {
		var value = Int(floatValue)
		if value < self.range.startIndex {
			return CGFloat(self.range.startIndex)
		}
		
		if value > self.range.endIndex {
			return CGFloat(self.range.endIndex)
		}
		
		return floatValue
	}
}