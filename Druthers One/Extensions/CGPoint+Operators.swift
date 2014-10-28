//
//  CGPoint+Operators.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import CoreGraphics


func +(a: CGPoint, b: CGPoint) -> CGPoint {
	return CGPoint(x: a.x + b.x, y: a.y + b.y)
}

func +(a: CGPoint, b: CGPoint?) -> CGPoint {
	if let b = b {
		return CGPoint(x: a.x + b.x, y: a.y + b.y)
	}
	
	return a
}


func -(a: CGPoint, b: CGPoint?) -> CGPoint {
	if let b = b {
		return CGPoint(x: a.x - b.x, y: a.y - b.y)
	}
	
	return a
}

func -(a: CGPoint?, b: CGPoint) -> CGPoint {
	if let a = a {
		return CGPoint(x: a.x - b.x, y: a.y - b.y)
	}
	
	return b
}