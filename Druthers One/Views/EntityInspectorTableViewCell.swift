//
//  EntityInspectorTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewCell: UITableViewCell {

	var draggableTitleView: EntityInspectorCellDraggableTitleView
	var scrubbableValueView: EntityInspectorCellScrubbableValueView
	
	weak var delegate: EntityInspectorTableViewCellDelegate?
	
	var entityTitle: String {
		get {
			return self.draggableTitleView.entityTitleLabel.text ?? ""
		}
		
		set {
			self.draggableTitleView.entityTitleLabel.text = newValue
			self.setNeedsLayout()
		}
	}
	
	
	/** The title of the thing being inspected. */
	var inspectedTitle: String {
		get {
			return self.draggableTitleView.entityPropertyTitleLabel.text ?? ""
		}
		
		set {
			self.draggableTitleView.entityPropertyTitleLabel.text = newValue
			self.setNeedsLayout()
		}
	}
	
	var intValueWhenDragBegan: Int?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		
		self.draggableTitleView = EntityInspectorCellDraggableTitleView(frame: CGRect())
		self.scrubbableValueView = EntityInspectorCellScrubbableValueView(frame: CGRect())

		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.contentView.addSubview(self.draggableTitleView)
		self.contentView.addSubview(self.scrubbableValueView)
		
		UIPanGestureRecognizer(target: self, action: "panDidRecognize:", view: self.scrubbableValueView)
		
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.draggableTitleView.sizeToFit()
		self.scrubbableValueView.sizeToFit()

		
		self.draggableTitleView.x = 0
		self.scrubbableValueView.moveToRightSideOfSuperview()
	}
	
	


}


protocol EntityInspectorTableViewCellDelegate: class {
	
	/** Called when the user updates the value in the inspector cell. */
	func propertyDidChange(updatedProperty: EntityProperty)
}
