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
	
	enum BuiltInAction {
		case Move
		case Turn
		
		var title: String {
			switch self {
			case .Move:
				return "move forward"
				
			case Turn:
				return "turn"
			}
		}
	}
	
	let title: String
	let inputs: [EntityActionInput]?
	
	/** This is a hack so we can support moving and turning...not extensible at all */
	let builtInType: BuiltInAction
	
	var firstInput: EntityActionInput? {
		return self.inputs?.first
	}
	
	init(title: String, inputs: [EntityActionInput]? = nil, builtInType: BuiltInAction) {
		self.title = title
		self.inputs = inputs
		self.builtInType = builtInType
	}
	
	
	func playForEntity(entity: Entity) {
		
		var updatedProperties = [EntityProperty]()
		switch self.builtInType {
		case .Move:
			break
		case .Turn:
			var direction = entity.direction.value as Int
			if let firstInput = self.firstInput {
				direction += firstInput.value as Int
			}
			entity.direction.value = direction
			updatedProperties.append(entity.direction)
		}
		
		entity.updateViewForProperties(updatedProperties)
	}
}