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
	
	
	// MARK: - Gesture recognizers
	
	/** Returns the current value as an int. Subclasses should implement. */
	func valueAsInt() -> Int {
		return 0
	}
	
	
	/** Updates the display labels. Subclasses should implement. */
	func updateLabels() {
		// no-op.
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
				
				self.updateValueAsInt(self.intValueWhenDragBegan! + Int(offsetX))
				self.notifyDelegateValueDidUpdate()
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
	
	
	/** Called when the value has been updated by the pan gesture recognizer. */
	func updateValueAsInt(updatedIntValue: Int) {
		// no-op, subclasses should implement.
	}
	
	/** Called after the value is updated to notify the delegate however you please. */
	func notifyDelegateValueDidUpdate() {
		// no-op, subclasses should implement.
	}
	


}


protocol EntityInspectorTableViewCellDelegate: class {
	
	/** Called when the user updates the value in the inspector cell. */
	func propertyDidChange(updatedProperty: EntityProperty)
}
