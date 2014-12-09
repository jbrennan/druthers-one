//
//  TouchInterceptor.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-05-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

protocol TouchInterceptor {
	
	/** Returns if the touch should be intercepted. */
	func shouldReceiveTouch(touch: UITouch) -> Bool
}
