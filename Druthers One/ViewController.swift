//
//  ViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EntityViewControllerParent {
	
	var entityControllers = [EntityController]()
	var inspector: PopoverViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let entity = Entity()

		let entityViewController = EntityViewController(entity: entity)
		entityViewController.parentController = self
		
		let entityController = EntityController(entity: entity, entityViewController: entityViewController)
		entityViewController.entityController = entityController
		
		self.entityControllers.append(entityController)
		
		self.beginShowingChildViewController(entityViewController)
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		for controller in self.entityControllers {
			let view = controller.entityViewController.view
			view.frameSize = controller.entityViewController.viewSize
		}
		
		self.inspector?.view.origin = CGPoint(x: 30, y: 30)
		self.inspector?.view.frameSize = CGSize(width: 300, height: 500)
		self.inspector?.view.updateMarkerBorder()
	}
	
	
	func openInspectorForEntityController(entityController: EntityController) {
		let entityInspector = EntityInspectorTableViewController()
		entityInspector.entityController = entityController
		entityController.entityInspector = entityInspector
		
		self.inspector = PopoverViewController()
		self.inspector?.contentViewController = entityInspector
		self.beginShowingChildViewController(self.inspector!)
	}
	

}

