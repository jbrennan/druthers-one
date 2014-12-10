//
//  DrawingGestureRecognizer.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

/** A pan gesture recognizer used for drawing. */
class DrawingGestureRecognizer: UIPanGestureRecognizer {
	
	var activeTouch: UITouch?
	
	override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
		super.touchesBegan(touches, withEvent: event)
		self.activeTouch = touches.anyObject() as? UITouch
	}
	
	
	override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
		super.touchesEnded(touches, withEvent: event)
		self.activeTouch = nil
	}
	
	
	override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
		super.touchesCancelled(touches, withEvent: event)
		self.activeTouch = nil
	}
}
