//
//  CloningGestureController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Gesture Controller used to clone a view. */
class CloningGestureController: GestureController {
	
	override func gestureDidBegin() {
		// do nothing
	}
	
	override func panDidBegin() {
		let oldViewBeingMoved = self.viewBeingMoved
		self.viewBeingMoved = self.gestureView.copy() as? UIView
		self.canvasView.addSubview(self.viewBeingMoved!)
		
		if let oldViewBeingMoved = oldViewBeingMoved {
			self.viewBeingMoved?.center = self.canvasView.convertPoint(oldViewBeingMoved.center, fromCoordinateSpace: oldViewBeingMoved.superview!)
		}
		
		super.panDidBegin()
	}
	
	
	override func gestureDidEndWithVelocity(velocity: CGPoint) {
		super.gestureDidEndWithVelocity(velocity)
		// We have to reset this for subsequent drags!
		self.viewBeingMoved = self.gestureView
	}
   
}
