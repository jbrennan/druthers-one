//
//  EntityViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityViewController: UIViewController, GestureControllerDelegate {
	
	/** The gesture controller responsible for handling interaction. */
	private var gestureController: GestureController?
	
	/** The parent controller responsible for screen-related activities. */
	weak var parentController: EntityViewControllerParent?
	
	private let entity = Entity()
	
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
		self.parentController?.openInspectorForEntity(self.entity)
	}
	
	
	func viewWasPanned() {
		self.entity.x = self.view.origin.x.toInt()
		self.entity.y = self.view.origin.y.toInt()
	}

}
