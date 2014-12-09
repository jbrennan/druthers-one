//
//  GCD+Shortcuts.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-05-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

func delayInSeconds(delay: Double, closure: () -> ()) {
	dispatch_after(
		dispatch_time(
			DISPATCH_TIME_NOW,
			Int64(delay * Double(NSEC_PER_SEC))
		),
		dispatch_get_main_queue(), closure)
}