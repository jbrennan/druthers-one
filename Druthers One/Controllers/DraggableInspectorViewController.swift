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
				self.scriptView().headerView?.titleLabel.text = inspectorViewController.entityController?.entity.title
				self.view.setNeedsLayout()
			}
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.scriptView().headerView?.hideButtons()
	}

}
