//
//  DraggableInspectorViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-24-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class DraggableInspectorViewController: DraggableViewController {
	
	var inspectorViewController: EntityInspectorTableViewController? {
		didSet {
			if let inspectorViewController = inspectorViewController {
				self.beginShowingChildViewController(inspectorViewController)
				self.scriptView().contentView = inspectorViewController.view
				self.view.setNeedsLayout()
			}
		}
	}

}
