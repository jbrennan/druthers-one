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
	var actions = [Any]()
	
	
	/** The x coordinate property of the entity's upper left corner. */
	var x: EntityProperty
	
	
	/** The y coordinate property of the entity's upper left corner. */
	var y: EntityProperty
	
	
	/** The direction in degrees the entity points in. */
	var direction: EntityProperty
	
	init() {
		self.x = EntityProperty(key: "x", value: 200)
		self.y = EntityProperty(key: "y", value: 255)
		self.direction = EntityProperty(key: "direction", value: 90)
		
		self.properties += [self.x, self.y, self.direction]
	}
	
	
}