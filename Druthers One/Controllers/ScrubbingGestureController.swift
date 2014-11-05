//
//  ScrubbingGestureController.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-03-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScrubbingGestureController {
	
	/** The controller's pan gesture recognizer. */
	let panGestureRecognizer: UIPanGestureRecognizer
	
	/** Gesture controller's delegate. */
	weak var delegate: ScrubbingGestureControllerDelegate?
	
	var enabled = true
	
	private var intValueWhenDragBegan: Int?
	
	
	init(gestureView: UIView) {
		self.panGestureRecognizer = UIPanGestureRecognizer()
		self.panGestureRecognizer.addTarget(self, action: "panDidRecognize:")
		gestureView.addGestureRecognizer(self.panGestureRecognizer)
	}
	
	
	@objc func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		if !self.enabled {
			return
		}
		
		let view = recognizer.view
		
		switch recognizer.state {
		case .Began:
			self.intValueWhenDragBegan = self.delegate?.initialScrubbingNumber
		case .Changed:
			if let rootView = UIApplication.rootViewController()?.view {
				let offsetX = recognizer.translationInView(rootView).x / 2.0
				self.delegate?.scrubberDidScrubToNumber(self.intValueWhenDragBegan! + Int(offsetX))
			}
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			self.intValueWhenDragBegan = nil
		default:
			break
		}
	}
}


protocol ScrubbingGestureControllerDelegate: class {
	
	/** The initial integer value the scrubber should start with. */
	var initialScrubbingNumber: Int { get }
	
	/** Called when the scrubber has scrubbed to a new number. This will be called continuously during scrubbing. */
	func scrubberDidScrubToNumber(newValue: Int)
}
