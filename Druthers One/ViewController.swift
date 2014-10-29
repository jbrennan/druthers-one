//
//  ViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EntityViewControllerParent {
	
	var entityViewControllers = [EntityViewController]()
	var inspector: PopoverViewController<EntityInspectorTableViewController>?
	
	override func viewDidLoad() {
		super.viewDidLoad()

		let entityViewController = EntityViewController()
		entityViewController.parentController = self
		self.entityViewControllers.append(entityViewController)
		
		self.beginShowingChildViewController(entityViewController)
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		for controller in self.entityViewControllers {
			let view = controller.view
			view.frameSize = controller.viewSize
		}
		
		self.inspector?.view.origin = CGPoint(x: 30, y: 30)
		self.inspector?.view.frameSize = CGSize(width: 300, height: 500)
		self.inspector?.view.updateMarkerBorder()
	}
	
	
	func openInspectorForEntity(entity: Entity) {
		self.inspector = PopoverViewController<EntityInspectorTableViewController>()
//		self.inspector?.contentViewController = EntityInspectorTableViewController(style: .Plain)
		self.beginShowingChildViewController(self.inspector!)
	}
	

}

