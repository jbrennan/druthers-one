//
//  EntityInspectorActionTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorActionTableViewCell: EntityInspectorTableViewCell {
	
	var action: EntityAction? {
		
		didSet {
			self.updateLabels()
			self.setNeedsLayout()
		}
	}
	
	
	override func valueAsInt() -> Int {
		return self.action?.firstInput?.value as Int
	}
	
	
	override func updateLabels() {
		if let action = self.action {
			self.inspectedTitle = "\(action.title)"
			if let input = action.firstInput? {
				self.scrubbableValueView.valueLabel.text = "\(input.value)"
				if let plural = input.pluralUnit {
					self.scrubbableValueView.unitLabel.text = "\(plural)"
				}
			}
		}
	}
	
	override func updateValueAsInt(updatedIntValue: Int) {
		self.action?.firstInput?.value = updatedIntValue
	}
}
