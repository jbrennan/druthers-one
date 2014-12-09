//
//  PsstContainerView.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-05-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class PsstContainerView: UIView {

	let speechBubbleView: SpeechBubbleView
	let psstView: UIView // I'm not satisfied with this being a redish circle ... :\
	
	var showingPsst: Bool {
		return self.psstView.superview != nil
	}
	
	override init(frame: CGRect) {
		self.speechBubbleView = SpeechBubbleView(frame: CGRect())
		self.psstView = UIView(frame: CGRect())
		
		super.init(frame: frame)
		
		self.psstView.backgroundColor = UIColor.KhanPsstBackgroundColor()
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
			
			self.speechBubbleView.sizeToFit()
			self.speechBubbleView.origin = CGPoint()
			
			var size = self.speechBubbleView.frameSize
			
			if let superview = self.psstView.superview {
				self.psstView.frameSize = CGSize(width: 60, height: 60)
				self.psstView.roundCorners()
				
				self.psstView.moveBelowSiblingView(self.speechBubbleView, margin: 10)
				self.psstView.moveToRightSideOfSuperview(margin: 25)
				size = CGRectUnion(self.speechBubbleView.frame, self.psstView.frame).size
			}
			return size
			
		}
	}
	
	
	override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
		for subview in self.subviews as [UIView] {
			let subviewPoint = subview.convertPoint(point, fromCoordinateSpace: self)
			if subview.pointInside(subviewPoint, withEvent: event) {
				return true
			}
		}
		
		return false
	}
	
	
	func showPsst() {
		self.addSubview(self.psstView)
		self.psstView.alpha = 0
		
		UIView.animateWithDuration(0.55, animations: { () -> Void in
			self.psstView.alpha = 1
		})
	}
	
	
	func showText(text: String) {
		self.speechBubbleView.showText(text)
		UIView.animateWithDuration(0.25, animations: { () -> Void in
			self.setNeedsLayout()
			self.layoutIfNeeded()
		})
	}

}
