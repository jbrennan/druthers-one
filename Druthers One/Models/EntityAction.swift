//
//  EntityAction.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation


/** Represents a method an Entity can do. */
class EntityAction: Copyable {
	
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
	
	
	func copy() -> Any {
		let inputs = self.inputs?.map {
			(input: EntityActionInput) -> EntityActionInput in
			return input.copy() as EntityActionInput
		}
		let copy = EntityAction(title: self.title, inputs: inputs, builtInType: self.builtInType)
		
	
		return copy
	}
	
	
	func playForEntity(entity: Entity) {
		
		var updatedProperties = [EntityProperty]()
		switch self.builtInType {
		case .Move:
			if let firstInput = self.firstInput {
				let direction = Double(entity.direction.value as Int)
				let length = Double(firstInput.value as Int)
				let dX = length * cos(direction.toRadians())
				let dY = length * sin(direction.toRadians())
				
				entity.x.updateValueTo((entity.x.value as Int) + Int(dX))
				entity.y.updateValueTo((entity.y.value as Int) - Int(dY)) // subtract because y starts at the top
				
				updatedProperties += [entity.x, entity.y]
			}
			break
		case .Turn:
			var direction = entity.direction.value as Int
			if let firstInput = self.firstInput {
				direction += firstInput.value as Int
			}
			entity.direction.updateValueTo(direction)
			updatedProperties.append(entity.direction)
		}
		
		entity.updateViewForProperties(updatedProperties)
	}
}