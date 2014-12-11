//
//  EntityViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityViewController: UIViewController, GestureControllerDelegate {

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	init(entity: Entity) {
		self.entity = entity
		super.init(nibName: nil, bundle: nil)
	}
	
	/** The gesture controller responsible for handling interaction. */
	private var gestureController: GestureController?
	
	/** The parent controller responsible for screen-related activities. */
	weak var parentController: EntityViewControllerParent?
	
	/** This is getting messy. */
	weak var entityController: EntityController?
	
	private let entity: Entity
	
	/** The size this view should be rendered at. */
	var viewSize: CGSize = {
		return CGSize(width: 100, height: 100)
	}()

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.gestureController = GestureController(gestureView: self.view, canvasView: self.parentController!.view)
		self.gestureController?.gestureControllerDelegate = self
    }
	
	
	override func loadView() {
		self.view = EntityView(frame: CGRect())
	}
	
	func viewWasTapped() {
		// This is messy too...
		self.parentController?.openInspectorForEntityController(self.entityController!)
	}
	
	func viewDidStartDragging() {
		// intentionally left blank.
	}
	
	func viewWasPanned() {
		self.entity.x.updateValueTo(self.view.centerX)
		self.entity.y.updateValueTo(self.view.centerY)
		self.entityController?.entityDidMove()
	}
	
	func initialViewRotationInRadians() -> CGFloat {
		return (self.entity.direction.evaluate() as CGFloat).toRadians()
	}
	
	func viewWasRotatedToAngleRadians(angleInRadians: CGFloat) {
		self.entity.direction.updateValueTo(-angleInRadians.toDegrees())
		self.updateViewRotation()
		self.entityController?.entityDidMove()
	}
	
	
	func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint) {
		droppedView?.tossWithVelocity(velocity)
	}
	
	
	func entityDidUpdate() {
		self.view.centerX = CGFloat(self.entity.x.evaluate() as CGFloat)
		self.view.centerY = CGFloat(self.entity.y.evaluate() as CGFloat)
		self.updateViewRotation()
	}
	
	
	private func updateViewRotation() {
		let degrees = -(self.entity.direction.evaluate() as CGFloat) //- 90
		let radians = degrees.toRadians()
		self.view.transform = CGAffineTransformMakeRotation(radians)
		
	}

}
