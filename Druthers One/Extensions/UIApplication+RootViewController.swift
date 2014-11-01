//
//  UIApplication+RootViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIApplication {
	
	class func rootViewController() -> UIViewController? {
		return self.sharedApplication().windows.first?.rootViewController
	}
}
