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
	
	
	private func valueAsInt() -> Int {
		return self.property?.value as Int
	}
	
	
	private func updateLabels() {
		if let property = self.property {
			self.inspectedTitle = "\(property.key)"
			self.scrubbableValueView.valueLabel.text = "\(property.value)"
		}
	}
	
	
	func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		let view = recognizer.view
		
		switch recognizer.state {
		case .Began:
			self.intValueWhenDragBegan = self.valueAsInt()
		case .Changed:
			if let window = self.window {
				let rootView = window.rootViewController?.view
				let offsetX = recognizer.translationInView(rootView!).x
				
				self.property?.value = self.intValueWhenDragBegan! + Int(offsetX)
				if let delegate = self.delegate {
					delegate.propertyDidChange(self.property!)
				}
				self.updateLabels()
			}
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			self.intValueWhenDragBegan = nil
		default:
			break
		}
	}

}
