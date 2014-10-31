//
//  ScriptListView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScriptListView: UIView {

	var blocks = [UIView]()
	
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
			
			var y = CGFloat(0)
			for view in self.blocks {
				view.sizeToFit()
				view.y = y
				y = view.maxY
			}
			
			
			
			return CGSize(width: 300, height: y)
			
		}
	}

}
