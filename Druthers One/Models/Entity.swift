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
	var properties: [String: Any] = ["x": 200, "y": 300]
	
	
	/** The x coordinate of the entity's upper left corner. */
	var x: Int {
		get {
			return self.properties["x"] as Int
		}
		
		set {
			self.properties["x"] = newValue
		}
	}
	
	
	/** The y coordinate of the entity's upper left corner. */
	var y: Int {
		get {
			return self.properties["y"] as Int
		}
		
		set {
			self.properties["y"] = newValue
		}
	}
	
	
}