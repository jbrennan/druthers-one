//
//  UIView+Layout.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIView {
	
	
	func moveToRightOfSiblingView(siblingView: UIView, margin: CGFloat = 0.0) {
		self.x = siblingView.maxX + margin
	}
}