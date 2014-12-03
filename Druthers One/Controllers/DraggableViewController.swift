//
//  DraggableViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-24-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class DraggableViewController: UIViewController, GestureControllerDelegate {
	
	let headerView = ScriptHeaderView(frame: CGRect())
	
	var gestureController: GestureController?
	
	func scriptView() -> ScriptView {
		return self.view as ScriptView
	}
	
	override func loadView() {
		self.view = ScriptView(frame: CGRect())
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.headerView)
		self.view.layer.borderWidth = 1
		self.view.layer.cornerRadius = 4 // TODO(jason): corners spill out...will need another container view in the mix.
	
		self.scriptView().headerView = self.headerView
		
		self.gestureController = GestureController(gestureView: self.headerView, canvasView: UIApplication.rootViewController()!.view)
		self.gestureController?.viewBeingMoved = self.view
		self.gestureController?.gestureControllerDelegate = self
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
