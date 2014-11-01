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
	
	var entityView: EntityView {
		return self.view as EntityView
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.gestureController = GestureController(gestureView: self.entityView, canvasView: self.parentController!.view)
		self.gestureController?.gestureControllerDelegate = self
		self.view.backgroundColor = UIColor.purpleColor()
		
		self.view.frameSize = self.viewSize
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
		self.entity.x.value = self.view.centerX.toInt()
		self.entity.y.value = self.view.centerY.toInt()
		self.entityController?.entityDidMove()
	}
	
	
	func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint) {
		if let droppedView = droppedView {
			let velocity = Vector(point: velocity)
			if velocity.magnitude > 2500 {
			let slideFactor = 0.01 * (velocity.magnitude / 200.0)
				var restingCenter = CGPoint(x: droppedView.centerX + (velocity.x * slideFactor), y: droppedView.centerY + (velocity.y * slideFactor))
				
				
				
				UIView.animateWithDuration(NSTimeInterval(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
					droppedView.center = restingCenter
					}, completion: { (finished: Bool) -> Void in
						droppedView.center = CGPoint(x: 300, y: 300)
				})
			}
		}
	}
	
	
	func entityDidUpdate() {
		self.view.centerX = CGFloat(self.entity.x.value as Int)
		self.view.centerY = CGFloat(self.entity.y.value as Int)
		let degrees = -(self.entity.direction.value as Int) //- 90
		let radians = CGFloat(degrees).toRadians()
		self.view.transform = CGAffineTransformMakeRotation(radians)
	}

}
