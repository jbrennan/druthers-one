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
		
		self.entity.controller = self
	}
	
	
	func entityDidMove() {
		self.entityInspector?.tableView.reloadData()
	}
	
	/** Called when the inspector updates a property. */
	func entityPropertyWasUpdated(property: EntityProperty) {
		// TODO: In the future we might want to just have some kind of global heartbeat that arranges/configures Entity views based on their properties instead of manually adjusting the view when the property changes. This could probably also solve the reverse problem of "somebody moved the entity, now update the inspector bits.
		
		self.entityViewController.entityDidUpdate()
	}
	
	
	func enqueueScriptForAction(action: EntityAction) {
		let script = EntityScript(entity: self.entity, actions: [action])
		ScriptController.enqueueScript(script)
	}
	
	
	
}