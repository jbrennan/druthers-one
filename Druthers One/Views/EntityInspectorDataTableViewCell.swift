//
//  EntityInspectorDataTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorDataTableViewCell: EntityInspectorTableViewCell {

	var property: EntityProperty? {
		
		didSet {
			self.updateLabels()
			self.setNeedsLayout()
		}
	}
	
	
	override func valueAsInt() -> Int {
		return self.property?.value as Int
	}
	
	
	override func updateLabels() {
		if let property = self.property {
			self.inspectedTitle = "\(property.key)"
			self.scrubbableValueView.valueLabel.text = "\(property.value)"
		}
	}
	
	override func updateValueAsInt(updatedIntValue: Int) {
		self.property?.value = updatedIntValue
	}
	
	
	override func notifyDelegateValueDidUpdate() {
		if let delegate = self.delegate {
			delegate.propertyDidChange(self.property!)
		}
	}
}
