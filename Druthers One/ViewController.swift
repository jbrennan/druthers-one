//
//  ViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let testView = UIView(frame: CGRect())
	var touchDownPointInTestView: CGPoint?
	var gestureController: GestureController?
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.testView.frameSize = CGSize(width: 200, height: 200)
		self.testView.origin = CGPoint(x: 100, y: 100)
		self.testView.backgroundColor = UIColor.grayColor()

		self.view.addSubview(self.testView)
		
		self.gestureController = GestureController(gestureView: self.testView, canvasView: self.view)
	}

}

