//
//  UIView+Appearance.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIView {
	
	func showDragShadow() {
		self.layer.shadowColor = UIColor.blackColor().CGColor
		self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
		self.layer.shadowOpacity = 0.8
		self.layer.shadowOffset = CGSize(width: 0, height: 3)
		
	}
	
	
	func hideDragShadow() {
		self.layer.shadowColor = UIColor.clearColor().CGColor
	}
	
}
