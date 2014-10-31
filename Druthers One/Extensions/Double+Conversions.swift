//
//  Double+Conversions.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

extension Double {
	func toRadians() -> Double {
		return self * M_PI / 180.0
	}
}