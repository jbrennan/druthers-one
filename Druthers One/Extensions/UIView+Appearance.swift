//
//  UIView+Appearance.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIView {
	
	
	/** The corner radius of the view's layer. */
	var cornerRadius: CGFloat {
		get {
			return self.layer.cornerRadius
		}
		
		set {
			self.layer.cornerRadius = newValue
		}
	}
	
	
	/** Rounds the view's corners. */
	func roundCorners() {
		self.cornerRadius = self.height / 2.0
	}
	
	func showDragShadow() {
		self.layer.shadowColor = UIColor.blackColor().CGColor
		self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
		self.layer.shadowOpacity = 0.8
		self.layer.shadowOffset = CGSize(width: 0, height: 3)
		
	}
	
	
	func hideDragShadow() {
		self.layer.shadowColor = UIColor.clearColor().CGColor
	}
	
	
	func updateMarkerBorder() {
		self.layer.borderColor = UIColor.darkGrayColor().CGColor
		self.layer.borderWidth = 4
		self.layer.cornerRadius = 10
		
	}
	
}
