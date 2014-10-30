//
//  EntityInspectorCellDraggableTitleView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Doesn't that name just roll off the tongue? */
class EntityInspectorCellDraggableTitleView: UIView, NSCopying {
	
	private let grippyView = GrippyView(frame: CGRect())
	let entityTitleLabel = UILabel(text: nil)
	let entityPropertyTitleLabel = UILabel(text: nil, fontWeight: .Bold)

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.entityTitleLabel)
		self.addSubview(self.entityPropertyTitleLabel)
		self.addSubview(self.grippyView)
		
		self.backgroundColor = UIColor.KhanLightGreyColor()
	}
	
	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	func copyWithZone(zone: NSZone) -> AnyObject {
		let copy = EntityInspectorCellDraggableTitleView(frame: CGRect())
		copy.bounds = self.bounds
		copy.center = self.center
		copy.entityTitleLabel.text = self.entityTitleLabel.text
		copy.entityPropertyTitleLabel.text = self.entityPropertyTitleLabel.text
		
		return copy
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		return self.sizeThatFitsByLayingOutSubviews(size, commitLayout: false)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.sizeThatFitsByLayingOutSubviews(self.bounds.size)
	}
	
	
	override func sizeThatFitsByLayingOutSubviews(size: CGSize, commitLayout: Bool = true) -> CGSize {
		return self.sizeThatFitsByRunningLayoutBlock(commitLayout: commitLayout) {
			() -> CGSize in
			let margin = CGFloat(10)
			
			self.grippyView.sizeToFit()
			self.grippyView.moveToVerticalCenterOfSuperview()
			self.grippyView.x = margin
			
			self.entityTitleLabel.sizeToFit()
			self.entityTitleLabel.moveToVerticalCenterOfSuperview()
			self.entityTitleLabel.moveToRightOfSiblingView(self.grippyView, margin: 5)
			self.entityTitleLabel.makeFrameIntegral()
			
			self.entityPropertyTitleLabel.sizeToFit()
			self.entityPropertyTitleLabel.moveToRightOfSiblingView(self.entityTitleLabel, margin: 5)
			self.entityPropertyTitleLabel.moveToVerticalCenterOfSuperview()
			
			return CGSize(width: self.entityPropertyTitleLabel.maxX + margin, height: 44.0)
			
		}
	}
}
