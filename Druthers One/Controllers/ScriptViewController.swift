//
//  ScriptViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScriptViewController: UIViewController, GestureControllerDelegate {
	
	var script: EntityScript?
	let headerView = ScriptHeaderView(frame: CGRect())
	let scriptListView = ScriptListView(frame: CGRect())
	
	var blockViewControllers = [BlockViewController]()
	
	var gestureController: GestureController?
	
	func scriptView() -> ScriptView {
		return self.view as ScriptView
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.headerView)
		self.view.layer.borderWidth = 2
		self.scriptView().headerView = self.headerView
		
		self.headerView.playButton.tapAction = { [weak self] in
			if let strongSelf = self {
				if let script = strongSelf.script {
					ScriptController.enqueueScript(script)
				}
			}
		}
		
		
		self.headerView.repeatButton.tapAction = { [weak self] in
			if let strongSelf = self {
				if let strongSelf = self {
					if let script = strongSelf.script {
						if script.repeats {
							script.repeats = false
						} else {
							script.repeats = true
							ScriptController.enqueueScript(script)
						}
					}
				}
			}
		}
		
		self.view.addSubview(self.scriptListView)
		self.scriptView().scriptListView = self.scriptListView
		
		self.gestureController = GestureController(gestureView: self.headerView, canvasView: UIApplication.rootViewController()!.view)
		self.gestureController?.viewBeingMoved = self.view
		self.gestureController?.gestureControllerDelegate = self

	}
	
	
	override func loadView() {
		self.view = ScriptView(frame: CGRect())
	}
	
	
	/** Returns if the view can be dropped here. */
	func acceptsActionView(view: UIView) -> Bool {
		return self.acceptsView(view)
	}
	
	
	func acceptsPropertyView(view: UIView) -> Bool {
		if !self.acceptsView(view) {
			return false
		}
		
		return self.blockViewControllerForPropertyView(view) != nil
	}
	
	
	private func blockViewControllerForPropertyView(view: UIView) -> BlockViewController? {
		for controller in self.blockViewControllers {
			if controller.acceptsPropertyView(view) {
				return controller
			}
		}
		
		return nil
	}
	
	
	private func acceptsView(view: UIView) -> Bool {
		let convertedFrame = self.view.convertRect(view.frame, fromCoordinateSpace: view.superview!)
		return self.view.bounds.intersects(convertedFrame)
	}
	
	
	/** Copies the action and makes a block for it. */
	func addBlockForAction(action: EntityAction) {
		if let script = self.script {
			let action = action.copy() as EntityAction
			
			script.actions.append(action)
			
			let blockController = BlockViewController(action: action)
			let view = blockController.blockView
			view.removePlayButton()
			
			view.titleView.entityTitleLabel.text = script.entity.title
			view.titleView.entityPropertyTitleLabel.text = action.title
			
			self.blockViewControllers.append(blockController)
			
			self.beginShowingChildViewController(blockController) {
				self.scriptListView.blocks.append(blockController.view)
				self.scriptListView.addSubview(blockController.view)
			}
			
		}
	}
	
	
	func addProperty(property: EntityProperty, forDroppedView droppedView: UIView) {
		if let controller = self.blockViewControllerForPropertyView(droppedView) {
			controller.addProperty(property, forDroppedView: droppedView)
		}
	}
	
	
	/** Called when the view is tapped. */
	func viewWasTapped() {}
	
	/** Called when the view starts dragging. */
	func viewDidStartDragging() {}
	
	/** Called continuously as the view is panned. */
	func viewWasPanned() {}
	
	/** Called when the view ends dragging. */
	func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint) {
		droppedView?.tossWithVelocity(velocity) {
			
		}
	}

}
