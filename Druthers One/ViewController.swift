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
	}
	

}

