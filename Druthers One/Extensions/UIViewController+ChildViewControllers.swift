//
//  UIViewController+ChildViewControllers.swift
//  Keys
//
//  Created by Jason Brennan on Sep-11-2014.
//  Copyright (c) 2014 Jason Brennan. All rights reserved.
//

import UIKit

extension UIViewController {
	
	/** Adds the given controller as a child view controller and adds it as a subview. */
	func beginShowingChildViewController(childViewController: UIViewController) {
		self.addChildViewController(childViewController)
		self.view.addSubview(childViewController.view)
		childViewController.didMoveToParentViewController(self)
	}
	
	
	/** Ends showing the given child view controller. */
	func endShowingChildViewController(childViewController: UIViewController) {
		childViewController.willMoveToParentViewController(nil)
		childViewController.view.removeFromSuperview()
		childViewController.removeFromParentViewController()
	}
}