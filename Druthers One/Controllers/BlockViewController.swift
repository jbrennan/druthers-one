//
//  BlockViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController, InputViewControllerDelegate {
	
	
	let action: EntityAction
	let inputViewControllers: [InputViewController]?
	
	var blockView: EntityInspectorCellActionView {
		return self.view as EntityInspectorCellActionView
	}
	
	init(action: EntityAction) {
		self.action = action
		super.init(nibName: nil, bundle: nil)
		
		// Trying out .map....I kind of like just using a loop better.
		self.inputViewControllers = self.action.inputs?.map {
			(input: EntityActionInput) -> InputViewController in
			
			let controller = InputViewController(entityActionInput: input)
			self.beginShowingChildViewController(controller) {
				self.blockView.addInputView(controller.valueView)
			}
			controller.delegate = self
			return controller
		}
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		self.view = EntityInspectorCellActionView(frame: CGRect())
	}

    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	
	func viewDidUpdate() {
		self.view.setNeedsLayout()
	}

}
