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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.headerView)
		
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

	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.headerView.sizeToFit()
		self.headerView.origin = CGPoint()
	}

}
