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
	private let rotateGesureRecognizer: UIRotationGestureRecognizer
	
	private var offsetTouchDownPoint: CGPoint?
	private var initialViewRotation: CGFloat?
	
	/** The view affected by the gestures. */
	var gestureView: UIView
	
	/** The view being moved by the gestures. This may be different than self.gestureView if eg we're dragging a clone. */
	var viewBeingMoved: UIView?
	
	/** The view containing the gestureView. */
	let canvasView: UIView
	
	weak var gestureControllerDelegate: GestureControllerDelegate?
	
	var excludedViews = [UIView]()
	
	init(gestureView: UIView, canvasView: UIView) {
		self.gestureView = gestureView
		self.viewBeingMoved = self.gestureView
		self.canvasView = canvasView
		
		self.panGestureRecognizer = UIPanGestureRecognizer()
		self.longPressGestureRecognizer = UILongPressGestureRecognizer()
		self.tapGestureRecognizer = UITapGestureRecognizer()
		self.rotateGesureRecognizer = UIRotationGestureRecognizer()
		
		super.init()
		
		self.panGestureRecognizer.addTarget(self, action: "panDidRecognize:")
		self.panGestureRecognizer.delegate = self
		self.panGestureRecognizer.maximumNumberOfTouches = 1 // Andy-proof it.
		
		
		self.longPressGestureRecognizer.addTarget(self, action: "longPressDidRecognize:")
		self.longPressGestureRecognizer.delegate = self
		self.longPressGestureRecognizer.minimumPressDuration = 0.2
		
		self.tapGestureRecognizer.addTarget(self, action: "tapDidRecognize")
		
		self.rotateGesureRecognizer.addTarget(self, action: "rotateDidRecognize:")
		self.rotateGesureRecognizer.delegate = self
		
		self.gestureView.addGestureRecognizer(self.panGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.longPressGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.tapGestureRecognizer)
		self.gestureView.addGestureRecognizer(self.rotateGesureRecognizer)
	}
	
	
	func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		let view = self.viewBeingMoved
		
		switch recognizer.state {
		case .Began:
			self.panDidBegin()
			self.offsetTouchDownPoint = view?.centerOfBounds - recognizer.locationInView(view)
		case .Changed:
			var location = recognizer.locationInView(view)
			self.viewBeingMoved?.center = self.canvasView.convertPoint(location + self.offsetTouchDownPoint, fromCoordinateSpace: view!)
			self.gestureControllerDelegate?.viewWasPanned()
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			self.gestureDidEndWithVelocity(recognizer.velocityInView(view))
			
		default:
			break
		}
	}
	
	
	func longPressDidRecognize(recognizer: UILongPressGestureRecognizer) {

		
		switch recognizer.state {
		case .Began:
			self.gestureDidBegin()
			
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			fallthrough
			// TODO: We need a better way to handle the long press...seems to cause problems
//			self.gestureDidEnd()
			
		default:
			break
		}
		
	}
	
	
	func rotateDidRecognize(recognizer: UIRotationGestureRecognizer) {
		switch recognizer.state {
			
		case .Began:
			self.initialViewRotation = self.gestureControllerDelegate?.initialViewRotationInRadians?()
		case .Changed:
			self.gestureControllerDelegate?.viewWasRotatedToAngleRadians?(recognizer.rotation + self.initialViewRotation!)

		default:
			break
		}
	}
	
	
	func gestureDidBegin() {
		self.viewBeingMoved?.showDragShadow()
		if let delegate = self.gestureControllerDelegate {
			delegate.viewDidStartDragging()
		}
	}
	
	func panDidBegin() {
		self.viewBeingMoved?.showDragShadow()
	}
	
	
	func gestureDidEndWithVelocity(velocity: CGPoint) {
		self.viewBeingMoved?.hideDragShadow()
		if let delegate = self.gestureControllerDelegate {
			delegate.viewDidEndDragging(self.viewBeingMoved, velocity: velocity)
		}
	}
	
	
	func tapDidRecognize() {
		self.gestureControllerDelegate?.viewWasTapped()
	}
	
	
	func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return contains([self.panGestureRecognizer, self.longPressGestureRecognizer, self.tapGestureRecognizer, self.rotateGesureRecognizer], otherGestureRecognizer)
	}
	
	func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
		for view in self.excludedViews {
			if view.pointInside(touch.locationInView(view), withEvent: nil) {
				return false
			}
		}
		
		return true
	}
	
}


@objc protocol GestureControllerDelegate: NSObjectProtocol {
	
	
	/** Called when the view is tapped. */
	func viewWasTapped()
	
	/** Called when the view starts dragging. */
	func viewDidStartDragging()
	
	/** Called continuously as the view is panned. */
	func viewWasPanned()
	
	
	/** Called when a rotation gesture starts. */
	optional func initialViewRotationInRadians() -> CGFloat
	
	/** Called continuously as the view is rotated. */
	optional func viewWasRotatedToAngleRadians(angleInRadians: CGFloat)
	
	/** Called when the view ends dragging. */
	func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint)
}


