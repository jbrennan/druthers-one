//
//  EntityViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityViewController: UIViewController {
	
	var gestureController: GestureController?
	weak var parentController: EntityViewControllerParent?
	var viewSize: CGSize = {
		return CGSize(width: 100, height: 100)
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.gestureController = GestureController(gestureView: self.view, canvasView: self.parentController!.view)
		
		self.view.backgroundColor = UIColor.purpleColor()
    }

}
