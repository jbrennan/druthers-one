//
//  GestureController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Contains the logic for a drag and drop interaction. */
class GestureController: NSObject, UIGestureRecognizerDelegate {
	
	let panGestureRecognizer: UIPanGestureRecognizer
	let longPressGestureRecognizer: UILongPressGestureRecognizer
	
	var offsetTouchDownPoint: CGPoint?
	
	/** The view affected by the gestures. */
	let gestureView: UIView
	
	/** The view containing the gestureView. */
	let canvasView: UIView
	
	init(gestureView: UIView, canvasView: UIView) {
		self.gestureView = gestureView
		self.canvasView = canvasView
		
		self.panGestureRecognizer = UIPanGestureRecognizer()
		self.longPressGestureRecognizer = UILongPressGestureRecognizer()
		
		super.init()
		
		self.panGestureRecognizer.addTarget(self, action: "panDidRecognize:")
		self.panGestureRecognizer.delegate = self
		self.panGestureRecognizer.maximumNumberOfTouches = 1 // Andy-proof it.
		
		
		self.longPressGestureRecognizer.addTarget(self, action: "longPressDidRecognize:")
		self.longPressGestureRecognizer.delegate = self
		self.longPressGestureRecognizer.minimumPressDuration = 0.2
		
		self.gestureView.addGestureRecognizer(self.panGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.longPressGestureRecognizer)
	}
	
	
	func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		let view = recognizer.view
		
		switch recognizer.state {
		case .Began:
			view?.showDragShadow()
			
			self.offsetTouchDownPoint = view?.centerOfBounds - recognizer.locationInView(view)
		case .Changed:
			var location = recognizer.locationInView(view)
			view?.center = self.canvasView.convertPoint(location + self.offsetTouchDownPoint, fromCoordinateSpace: view!)
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			view?.hideDragShadow()
			
		default:
			break
		}
	}
	
	
	func longPressDidRecognize(recognizer: UILongPressGestureRecognizer) {

		
		switch recognizer.state {
		case .Began:
			recognizer.view?.showDragShadow()
			
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			recognizer.view?.hideDragShadow()
			
		default:
			break
		}
		
	}
	
	
	func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
	}
	
}
