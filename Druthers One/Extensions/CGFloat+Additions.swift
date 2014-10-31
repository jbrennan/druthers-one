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
}