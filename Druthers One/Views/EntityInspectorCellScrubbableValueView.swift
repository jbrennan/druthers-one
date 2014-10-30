//
//  EntityInspectorCellScrubbableValueView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorCellScrubbableValueView: UIView {

    let valueLabel = UILabel(text: nil, fontWeight: .Bold)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.valueLabel)
		self.backgroundColor = UIColor.KhanLightGreyColor()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
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
			self.valueLabel.sizeToFit()
			self.valueLabel.moveToVerticalCenterOfSuperview()
			
			let margin = CGFloat(10.0)
			self.valueLabel.x = margin
			
			return CGSize(width: self.valueLabel.maxX + margin, height: 44.0)
		}
	}

}
