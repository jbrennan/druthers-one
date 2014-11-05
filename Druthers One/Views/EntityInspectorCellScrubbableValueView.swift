//
//  EntityInspectorCellScrubbableValueView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorCellScrubbableValueView: UIView, NSCopying {

    let valueLabel = UILabel(text: nil, fontWeight: .Bold)
	let unitLabel = UILabel(fontWeight: .Normal)
	
	/** The view for a dropped property. In the future, this can really be any kind of "evaluatable" view. */
	var propertyView: UIView? {
		willSet {
			if let propertyView = self.propertyView {
				propertyView.removeFromSuperview()
			}
		}
		
		didSet {
			if let propertyView = self.propertyView {
				self.addSubview(propertyView)
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.valueLabel)
		self.addSubview(self.unitLabel)
		self.backgroundColor = UIColor.KhanLightGreyColor()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	func copyWithZone(zone: NSZone) -> AnyObject {
		let copy = EntityInspectorCellScrubbableValueView(frame: CGRect())
		copy.valueLabel.text = self.valueLabel.text
		copy.unitLabel.text = self.unitLabel.text
		
		return copy
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		let valueString = self.valueLabel.text
		if valueString == nil || countElements(self.valueLabel.text!) < 1 {
			return CGSize()
		}
		return self.sizeThatFitsByLayingOutSubviews(size, commitLayout: false)
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.sizeThatFitsByLayingOutSubviews(self.bounds.size)
	}
	
	
	override func sizeThatFitsByLayingOutSubviews(size: CGSize, commitLayout: Bool = true) -> CGSize {
		return self.sizeThatFitsByRunningLayoutBlock(commitLayout: commitLayout) { () -> CGSize in
			
			let margin = CGFloat(10.0)
			var siblingView: UIView = self.valueLabel
			
			if let propertyView = self.propertyView {
				propertyView.sizeToFit()
				propertyView.moveToVerticalCenterOfSuperview()
				propertyView.x = margin
				self.bringSubviewToFront(propertyView)
				siblingView = propertyView
			} else {
				
				self.valueLabel.sizeToFit()
				self.valueLabel.moveToVerticalCenterOfSuperview()
				
				self.valueLabel.x = margin
			}
			
			self.unitLabel.sizeToFit()
			self.unitLabel.moveToVerticalCenterOfSuperview()
			self.unitLabel.moveToRightOfSiblingView(siblingView, margin: 5.0)
			
			var width = self.valueLabel.maxX + margin
			if self.unitLabel.text != nil && countElements(self.unitLabel.text!) > 1 {
				width = width + self.unitLabel.width + 5.0
			}
			
			return CGSize(width: width, height: 44.0)
		}
	}

}
