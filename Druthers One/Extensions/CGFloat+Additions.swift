//
//  CGFloat+Additions.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import CoreGraphics

extension CGFloat {
	
	/** @return An Int version of the receiver. */
	func toInt() -> Int {
		return Int(self)
	}
	
	func toRadians() -> CGFloat {
		return self / CGFloat(180.0) * CGFloat(M_PI)
	}
	
	
	func toDegrees() -> CGFloat {
		return self * CGFloat(180.0) / CGFloat(M_PI)
	}
	
	/** Clamps the receiver between the lower and the upper bounds. */
	func clamp(lower: CGFloat, upper: CGFloat) -> CGFloat {
		if self < lower {
			return lower
		}
		
		if self > upper {
			return upper
		}
		
		return self
	}
}