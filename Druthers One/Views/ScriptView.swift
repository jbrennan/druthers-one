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
	var contentView: UIView?
	
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
			
			self.headerView?.sizeToFit()
			
			self.contentView?.sizeToFit()

			if let scriptView = self.contentView {
				let contentSize = scriptView.sizeThatFits(CGSize(width: CGFloat(300), height: CGFloat.max))
				scriptView.frameSize = contentSize
				if let headerView = self.headerView {
					scriptView.y = headerView.maxY
				}
			}
			

			let maxX = self.headerView?.maxX ?? 300
			let maxY = self.contentView?.maxY ?? 100
			return CGSize(width: maxX, height: maxY)
			
		}
	}
}
