//
//  Vector.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-01-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import CoreGraphics

/** Every good library needs a vector type. */
struct Vector {
	
	/** The X component of the vector. */
	let x: CGFloat
	
	/** The Y component of the vector. */
	let y: CGFloat
	
	
	/** @return The angle in degrees of the vector. */
	var angleInDegrees: CGFloat {
		return atan(self.y / self.x)
	}
	
	
	/** The magnitude of the vector. */
	var magnitude: CGFloat {
		return sqrt(pow(self.x, 2.0) + pow(self.y, 2.0))
	}
	
	
	init(point: CGPoint) {
		self.x = point.x
		self.y = point.y
	}
	
	
}
