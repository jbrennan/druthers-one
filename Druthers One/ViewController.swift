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
		
		NSNotificationCenter.addObserver(self, notificationName: "ActionBlockDropped", selector: "actionBlockWasDropped:")
		NSNotificationCenter.addObserver(self, notificationName: "PropertyBlockDropped", selector: "propertyBlockWasDropped:")
	}
	
	
	func actionBlockWasDropped(notification: NSNotification) {
		let userInfo = notification.userInfo!
		
		let view: UIView = userInfo["view"]! as UIView
		
		let action = userInfo["action"]! as EntityAction
		if let scriptViewController = self.scriptViewControllerAcceptingView(view) {
			scriptViewController.addBlockForAction(action)
		} else {
			// Create the script controller and drop the block in it.
			let scriptViewController = ScriptViewController()
			scriptViewController.addBlockForAction(action)
			scriptViewController.view.sizeToFit()
			scriptViewController.view.center = view.center // assumes the view is in the same coordinate space!
			self.scriptViewControllers.append(scriptViewController)
			
			self.beginShowingChildViewController(scriptViewController)
		}
	}
	
	
	func propertyBlockWasDropped(notification: NSNotification) {
		
	}
	
	
	func scriptViewControllerAcceptingView(view: UIView) -> ScriptViewController? {
		for scriptViewController in self.scriptViewControllers {
			if scriptViewController.acceptsView(view) {
				return scriptViewController
			}
		}
		
		return nil
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

