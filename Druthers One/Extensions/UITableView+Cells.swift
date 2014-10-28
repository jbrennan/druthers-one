//
//  UITableView+Cells.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UITableView {
	
	func registerClass(cellClass: AnyClass) {
		self.registerClass(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
	}
}