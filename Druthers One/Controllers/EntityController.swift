//
//  EntityController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** This class acts as a two-way channel between the Entity/View and the Entity Inspector. */
class EntityController {
	
	
	// I might want to make these unowned?
	let entity: Entity
	let entityViewController: EntityViewController
	var entityInspector: EntityInspectorTableViewController?
	
	init(entity: Entity, entityViewController: EntityViewController) {
		self.entity = entity
		self.entityViewController = entityViewController
	}
	
	
	func entityDidMove() {
		self.entityInspector?.tableView.reloadData()
	}
	
	
	
}