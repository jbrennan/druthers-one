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
	
	
	/** The x of the receiver's center. */
	var centerX: CGFloat {
		get {
			return self.center.x
		}
		
		set {
			var center = self.center
			center.x = newValue
			self.center = center
		}
	}
	
	
	/** The y of the receiver's center. */
	var centerY: CGFloat {
		get {
			return self.center.y
		}
		
		set {
			var center = self.center
			center.y = newValue
			self.center = center
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
	
	
	/** The width of the receiver's bounds. */
	var width: CGFloat {
		get {
			return self.bounds.width
		}
		
		set {
			var bounds = self.bounds
			bounds.size.width = newValue
			self.bounds = bounds
		}
	}
	
	
	/** The height of the receiver's bounds. */
	var height: CGFloat {
		get {
			return self.bounds.height
		}
		
		set {
			var bounds = self.bounds
			bounds.size.height = newValue
			self.bounds = bounds
		}
	}
	
	
	/** @return The center point of the receiver's bounds. */
	var centerOfBounds: CGPoint {
		get {
			return CGPoint(x: self.bounds.width / 2.0, y: self.bounds.height / 2.0)
		}
	}
	
	
	/** @return The max X of the receiver's frame. */
	var maxX: CGFloat {
		return self.frame.maxX
	}
	
	
	/** @return The max Y of the receiver's frame. */
	var maxY: CGFloat {
		return self.frame.maxY
	}
	
	
	
}