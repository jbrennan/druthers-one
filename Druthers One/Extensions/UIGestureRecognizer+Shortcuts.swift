//
//  UIGestureRecognizer+Shortcuts.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {


	/** Convenience initializer to add the recognizer to the given view. */
	convenience init(target: AnyObject, action: Selector, view: UIView?) {
		self.init(target: target, action: action)

		view?.addGestureRecognizer(self)
	}
}
