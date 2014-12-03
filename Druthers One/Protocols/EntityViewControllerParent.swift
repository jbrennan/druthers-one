//
//  EntityViewControllerParent.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Classes conforming to this protocol act as a parent to the entity view controller. */
protocol EntityViewControllerParent: class {
	var view: UIView! {
		get
	}
	
	/** Open the entity inspector for the given entity controller. */
	func openInspectorForEntityController(entityController: EntityController)
}