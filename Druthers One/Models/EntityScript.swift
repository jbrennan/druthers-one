//
//  EntityScript.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** Represents a script of actions for a given entity. */
class EntityScript {
	
	/** An ordered list of actions to perform. */
	var actions = [EntityAction]()
	
	/** Controls if the script executes again when done. */
	var repeats = false
	
	unowned let entity: Entity
	
	
	init(entity: Entity, actions: [EntityAction]? = nil) {
		self.entity = entity
		if let actions = actions {
			self.actions += actions
		}
	}
	
	
	/** Synchronously plays all the actions in the script...that's probably bad...*/
	func play() {
		for action in self.actions {
			action.playForEntity(self.entity)
		}
	}
	
}