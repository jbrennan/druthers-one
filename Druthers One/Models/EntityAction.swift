//
//  EntityAction.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** Represents a method an Entity can do. */
class EntityAction {
	
	let title: String
	let inputs: [EntityActionInput]?
	
	init(title: String, inputs: [EntityActionInput]? = nil) {
		self.title = title
		self.inputs = inputs
	}
}