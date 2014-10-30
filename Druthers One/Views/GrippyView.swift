//
//  GrippyView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class GrippyView: UIView {
	
	let lineHeight = CGFloat(16)
	let gap = CGFloat(3)
	
	let lineViews = [UIView(frame: CGRect()), UIView(frame: CGRect()), UIView(frame: CGRect())]
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		for view in self.lineViews {
			view.backgroundColor = UIColor.KhanMediumGreyColor().colorWithAlphaComponent(0.6)
			self.addSubview(view)
		}
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		for (index, view) in enumerate(self.lineViews) {
			view.width = 1.0
			view.height = self.lineHeight
			
			view.x = CGFloat(index) * self.gap
			view.y = 0;
			
		}
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		return CGSize(width: self.gap * CGFloat(countElements(self.lineViews)), height: self.lineHeight)
	}
}
