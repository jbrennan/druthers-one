//
//  ScriptView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScriptView: UIView {

	var headerView: UIView?
	var scriptListView: UIView?
	
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
			
			self.headerView?.sizeToFit()
			
			self.scriptListView?.sizeToFit()
			if let scriptView = self.scriptListView {
				if let headerView = self.headerView {
					scriptView.y = headerView.maxY
				}
			}
			

			let maxX = self.headerView?.maxX ?? 300
			let maxY = self.scriptListView?.maxY ?? 100
			return CGSize(width: maxX, height: maxY)
			
		}
	}
}
