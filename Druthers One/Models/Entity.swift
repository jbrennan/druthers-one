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
	
	
	/** The x coordinate property of the entity's upper left corner. */
	var x: EntityProperty
	
	
	/** The y coordinate property of the entity's upper left corner. */
	var y: EntityProperty
	
	init() {
		self.x = EntityProperty(key: "x", value: 200)
		self.y = EntityProperty(key: "y", value: 255)
		
		self.properties += [self.x, self.y]
	}
	
	
}