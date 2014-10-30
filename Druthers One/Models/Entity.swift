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
	
	
	/** The x coordinate property of the entity's upper left corner. */
	var x = EntityProperty(key: "x", value: 200)
	
	
	/** The y coordinate property of the entity's upper left corner. */
	var y = EntityProperty(key: "y", value: 255)
	
	
	/** The direction in degrees the entity points in. */
	var direction = EntityProperty(key: "direction", value: 90)
	
	init() {
		self.properties += [self.x, self.y, self.direction]
		self.actions.append(EntityAction(title: "move forward", inputs: [EntityActionInput(title: "forward", unit: "step", defaultValue: 100)]))
		self.actions.append(EntityAction(title: "turn", inputs: [EntityActionInput(title: "left", unit: "degrees", defaultValue: 5)]))
	}
	
	
}