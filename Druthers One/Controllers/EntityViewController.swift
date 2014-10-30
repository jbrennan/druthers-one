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
		self.view.backgroundColor = UIColor.purpleColor()
    }
	
	
	func viewWasTapped() {
		// This is messy too...
		self.parentController?.openInspectorForEntityController(self.entityController!)
	}
	
	
	func viewWasPanned() {
		self.entity.x.value = self.view.origin.x.toInt()
		self.entity.y.value = self.view.origin.y.toInt()
		self.entityController?.entityDidMove()
	}
	
	
	func entityDidUpdate() {
		self.view.x = CGFloat(self.entity.x.value as Int)
		self.view.y = CGFloat(self.entity.y.value as Int)
	}

}
