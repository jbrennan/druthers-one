//
//  UIView+Geometry.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Shortcuts for view properties. */
extension UIView {

	/** @return the min X of the receiver's frame. */
	var x: CGFloat {
		get {
			return self.frame.minX
		}

		set {
			var frame = self.frame
			frame.origin.x = newValue
			self.frame = frame
		}
	}


	/** @return the min Y of the receiver's frame. */
	var y: CGFloat {
		get {
			return self.frame.minY
		}

		set {
			var frame = self.frame
			frame.origin.y = newValue
			self.frame = frame
		}
	}


	/** @return the origin of the receiver's frame. */
	var origin: CGPoint {
		get {
			return self.frame.origin
		}

		set {
			var frame = self.frame
			frame.origin = newValue
			self.frame = frame
		}
	}


	/** @return the size of the receiver's frame. */
	var frameSize: CGSize {
		get {
			return self.frame.size
		}

		set {
			var frame = self.frame
			frame.size = newValue
			self.frame = frame
		}
	}
	
	
	/** @return The center point of the receiver's bounds. */
	var centerOfBounds: CGPoint {
		get {
			return CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0)
		}
	}
	
}