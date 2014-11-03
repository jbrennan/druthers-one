//
//  Entity.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation

/** Represents an "Object" in this pseudo-OOP environment-o-mine (but "Object" is a terrible name..learned that the hard way at Hopscotch). */
class Entity {
	
	/** The title/name of this entity. */
	var title = "Entity"
	
	/** Properties/data belonging to this entity. */
	var properties = [EntityProperty]()
	
	/** Actions (methods) the entity can do. */
	var actions = [EntityAction]()
	
	/** Any scripts the Entity has (these are probably mostly made by the user). */
	var scripts = [EntityScript]()
	
	
	/** The x coordinate property of the entity's upper left corner. */
	var x = EntityProperty(key: "x", value: 200)
	
	
	/** The y coordinate property of the entity's upper left corner. */
	var y = EntityProperty(key: "y", value: 255)
	
	
	/** The direction in degrees the entity points in. */
	var direction = EntityProperty(key: "direction", value: 0, range: EntityValueRange(range: -179...180, wraps: true))
	
	/** The controller owns the entity for now. */
	weak var controller: EntityController?
	
	init() {
		self.properties += [self.x, self.y, self.direction]
		self.actions.append(EntityAction(title: "move forward", inputs: [EntityActionInput(title: "forward", unit: "step", defaultValue: 5)], builtInType: .Move))
		self.actions.append(EntityAction(title: "turn", inputs: [EntityActionInput(title: "left", unit: "degree", defaultValue: 5)], builtInType: .Turn))
	}
	
	
	/** This doesn't really belong here... */
	func updateViewForProperties(properties: [EntityProperty]) {
		
		// Really, what should happen instead is whatever is in charge of placing the views should get a callback at the end of the frame and should go though all the entities and just update the appearance of all their views.
		for property in properties {
			self.controller?.entityPropertyWasUpdated(property)
		}
		self.controller?.entityDidMove() // to update the inspector
	}
	
	
}