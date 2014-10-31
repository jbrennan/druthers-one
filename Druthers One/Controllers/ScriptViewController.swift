//
//  ScriptViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScriptViewController: UIViewController {
	
	var script: EntityScript?
	let headerView = ScriptHeaderView(frame: CGRect())
	let scriptListView = ScriptListView(frame: CGRect())
	
	func scriptView() -> ScriptView {
		return self.view as ScriptView
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.headerView)
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

	}
	
	
	override func loadView() {
		self.view = ScriptView(frame: CGRect())
	}
	
	
//	override func viewDidLayoutSubviews() {
//		super.viewDidLayoutSubviews()
//		
//		self.headerView.sizeToFit()
//		self.headerView.origin = CGPoint()
//	}
	
	
	/** Returns if the view can be dropped here. */
	func acceptsView(view: UIView) -> Bool {
		let convertedFrame = self.view.convertRect(view.frame, fromCoordinateSpace: view.superview!)
		return self.view.bounds.contains(convertedFrame)
	}
	
	
	func addBlockForAction(action: EntityAction) {
		
	}

}
