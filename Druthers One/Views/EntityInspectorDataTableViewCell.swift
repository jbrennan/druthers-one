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
	

	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.draggableActionView.removePlayButton()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
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
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.scrubbableValueView.sizeToFit()
		self.scrubbableValueView.moveToRightSideOfSuperview()
	}
	
	
	override func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint) {
		// Announce that the view has been dropped.
		if let view = droppedView {
			let userInfo = ["property": self.property!, "view": view, "entity": self.entity!]
			NSNotificationCenter.postNotificationNamed("PropertyBlockDropped", userInfo: userInfo)
		}
	}
}
