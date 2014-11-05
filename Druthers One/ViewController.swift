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
	
	var scriptViewControllers = [ScriptViewController]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let entity = Entity()

		let entityViewController = EntityViewController(entity: entity)
		entityViewController.parentController = self
		
		let entityController = EntityController(entity: entity, entityViewController: entityViewController)
		entityViewController.entityController = entityController
		
		self.entityControllers.append(entityController)
		
		self.beginShowingChildViewController(entityViewController)
		
		
		// entity 2
		let entity2 = Entity()
		
		let entityViewController2 = EntityViewController(entity: entity2)
		entityViewController2.parentController = self
		
		let entityController2 = EntityController(entity: entity2, entityViewController: entityViewController2)
		entityViewController2.entityController = entityController2
		entityViewController2.view.backgroundColor = UIColor.orangeColor()
		
		self.entityControllers.append(entityController2)
		
		self.beginShowingChildViewController(entityViewController2)
		
		
		NSNotificationCenter.addObserver(self, notificationName: "ActionBlockDropped", selector: "actionBlockWasDropped:")
		NSNotificationCenter.addObserver(self, notificationName: "PropertyBlockDropped", selector: "propertyBlockWasDropped:")
	}
	
	
	func actionBlockWasDropped(notification: NSNotification) {
		let userInfo = notification.userInfo!
		
		let view: UIView = userInfo["view"]! as UIView
		
		let action = userInfo["action"]! as EntityAction
		if let scriptViewController = self.scriptViewControllerAcceptingActionView(view) {
			scriptViewController.addBlockForAction(action)
			scriptViewController.view.sizeToFit()
		} else {
			// Create the script controller and drop the block in it.
			let scriptViewController = ScriptViewController()
			
			// TODO: Should probably just initialize the view controller with an Entity and have it make its own blank script...
			let entity = userInfo["entity"]! as Entity
			scriptViewController.script = EntityScript(entity: entity, actions: nil)
			
			
			scriptViewController.addBlockForAction(action)
			scriptViewController.view.sizeToFit()
			let canvasView = self.view
			let convertedCenter = view.origin
			
			self.scriptViewControllers.append(scriptViewController)
			
			self.beginShowingChildViewController(scriptViewController)
			scriptViewController.view.origin = convertedCenter // assumes the view is in the same coordinate space!
		}
	}
	
	
	func propertyBlockWasDropped(notification: NSNotification) {
		let userInfo = notification.userInfo!
		let view = userInfo["view"]! as UIView
		
		let property = userInfo["property"]! as EntityProperty
		if let scriptViewController = self.scriptViewControllerAcceptingPropertyView(view) {
			scriptViewController.addProperty(property, forDroppedView: view)
		} else {
			// poof!
		}
	}
	
	
	func scriptViewControllerAcceptingActionView(view: UIView) -> ScriptViewController? {
		for scriptViewController in self.scriptViewControllers {
			if scriptViewController.acceptsActionView(view) {
				return scriptViewController
			}
		}
		
		return nil
	}
	
	
	func scriptViewControllerAcceptingPropertyView(propertyView: UIView) -> ScriptViewController? {
		for scriptViewController in self.scriptViewControllers {
			if scriptViewController.acceptsPropertyView(view) {
				return scriptViewController
			}
		}
		
		return nil
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.inspector?.view.origin = CGPoint(x: 30, y: 30)
		self.inspector?.view.frameSize = CGSize(width: 300, height: 500)
		self.inspector?.view.updateMarkerBorder()
		
		for controller in self.scriptViewControllers {
			let view = controller.view
			view.sizeToFit()
		}
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

