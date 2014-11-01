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
	
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		let scrubber = self.scrubbableValueView
		scrubber.removeFromSuperview()
		self.draggableActionView.addInputView(scrubber)
		self.setNeedsLayout()
		
		self.draggableActionView.playButton?.tapAction = { [weak self] in
			if let strongSelf = self {
				strongSelf.playButtonWasPressed()
			}
		}
	}
	
	func playButtonWasPressed() {
		self.delegate?.playButtonWasPressedForAction(self.action!)
	}
	
	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
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
	
	
	override func viewDidEndDragging(droppedView: UIView?, velocity: CGPoint) {
		// Announce that the view has been dropped.
		if let view = droppedView {
			let userInfo = ["action": self.action!, "view": view, "entity": self.entity!]
			NSNotificationCenter.postNotificationNamed("ActionBlockDropped", userInfo: userInfo)
			view.removeFromSuperview()
		}
	}
	
}
