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
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.testView.frameSize = CGSize(width: 200, height: 200)
		self.testView.origin = CGPoint(x: 100, y: 100)
		self.testView.backgroundColor = UIColor.grayColor()

		self.view.addSubview(self.testView)

		UIPanGestureRecognizer(target: self, action: "panDidRecognize:", view: self.testView).maximumNumberOfTouches = 1
	}


	func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		switch recognizer.state {
		case .Began:
			recognizer.view?.showDragShadow()
			let view = recognizer.view
			self.touchDownPointInTestView = view?.centerOfBounds - recognizer.locationInView(view)
		case .Changed:
			var location = recognizer.locationInView(recognizer.view)
			recognizer.view?.center = self.view.convertPoint(location + self.touchDownPointInTestView, fromCoordinateSpace: recognizer.view!)
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			recognizer.view?.hideDragShadow()
			break

		default:
			break
		}
	}

}

