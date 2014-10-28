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
	
	private let panGestureRecognizer: UIPanGestureRecognizer
	private let longPressGestureRecognizer: UILongPressGestureRecognizer
	private let tapGestureRecognizer: UITapGestureRecognizer
	
	private var offsetTouchDownPoint: CGPoint?
	
	/** The view affected by the gestures. */
	let gestureView: UIView
	
	/** The view containing the gestureView. */
	let canvasView: UIView
	
	weak var gestureControllerDelegate: GestureControllerDelegate?
	
	init(gestureView: UIView, canvasView: UIView) {
		self.gestureView = gestureView
		self.canvasView = canvasView
		
		self.panGestureRecognizer = UIPanGestureRecognizer()
		self.longPressGestureRecognizer = UILongPressGestureRecognizer()
		self.tapGestureRecognizer = UITapGestureRecognizer()
		
		super.init()
		
		self.panGestureRecognizer.addTarget(self, action: "panDidRecognize:")
		self.panGestureRecognizer.delegate = self
		self.panGestureRecognizer.maximumNumberOfTouches = 1 // Andy-proof it.
		
		
		self.longPressGestureRecognizer.addTarget(self, action: "longPressDidRecognize:")
		self.longPressGestureRecognizer.delegate = self
		self.longPressGestureRecognizer.minimumPressDuration = 0.2
		
		self.tapGestureRecognizer.addTarget(self, action: "tapDidRecognize")
		
		self.gestureView.addGestureRecognizer(self.panGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.longPressGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.tapGestureRecognizer)
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
			self.gestureControllerDelegate?.viewWasPanned()
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
	
	
	func tapDidRecognize() {
		self.gestureControllerDelegate?.viewWasTapped()
	}
	
	
	func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
	}
	
}


protocol GestureControllerDelegate: NSObjectProtocol {
	
	/** Called when the view is tapped. */
	func viewWasTapped()
	
	/** Called continuously as the view is panned. */
	func viewWasPanned()
}
