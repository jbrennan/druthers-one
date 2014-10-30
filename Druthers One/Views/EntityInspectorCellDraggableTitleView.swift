//
//  EntityInspectorCellDraggableTitleView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Doesn't that name just roll off the tongue? */
class EntityInspectorCellDraggableTitleView: UIView {
	
	let entityTitleLabel = UILabel(text: nil)
	let entityPropertyTitleLabel = UILabel(text: nil, fontWeight: .Bold)

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.entityTitleLabel)
		self.addSubview(self.entityPropertyTitleLabel)
		
		self.backgroundColor = UIColor.KhanLightGreyColor()
	}
	
	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
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
			
			self.entityTitleLabel.sizeToFit()
			self.entityTitleLabel.makeFrameIntegral()
			self.entityTitleLabel.moveToVerticalCenterOfSuperview()
			self.entityTitleLabel.x = margin
			
			self.entityPropertyTitleLabel.sizeToFit()
			self.entityPropertyTitleLabel.moveToRightOfSiblingView(self.entityTitleLabel, margin: 5)
			self.entityPropertyTitleLabel.moveToVerticalCenterOfSuperview()
			
			return CGSize(width: self.entityPropertyTitleLabel.maxX + margin, height: 44.0)
			
		}
	}
}
