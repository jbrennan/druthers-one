//
//  SpeechBubbleView.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-04-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class SpeechBubbleView: UIView {

	private let bubbleView: UIView
	let textLabel: UILabel
	private let tailView: UIImageView
	
	private var showsTail = false
	
	override init(frame: CGRect) {
		self.bubbleView = UIView(frame: CGRect())
		self.textLabel = UILabel(text: "psst...", fontSize: 18, fontWeight: .Normal)
		self.tailView = UIImageView(image: UIImage(named: "tail"))
		
		super.init(frame: frame)
		
		self.bubbleView.backgroundColor = UIColor.KhanSpeechBubbleColor()
		
		self.addSubview(self.tailView)
		self.addSubview(self.bubbleView)
		self.bubbleView.addSubview(self.textLabel)
		
		self.transform = CGAffineTransformMakeScale(0.01, 0.01)
		self.alpha = 0;
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
			
			self.textLabel.sizeToFit()
			self.bubbleView.origin = CGPoint()
			self.bubbleView.width = self.textLabel.width + (2 * 21)
			self.bubbleView.height = 40
			self.bubbleView.layer.cornerRadius = self.bubbleView.height / 2.0
			
			self.textLabel.moveToCenterOfSuperview()
			
			self.tailView.sizeToFit()
			self.tailView.y = self.showsTail ? self.bubbleView.maxY : self.bubbleView.maxY - self.tailView.height
			self.tailView.y = self.bubbleView.maxY
			self.tailView.moveToRightSideOfSuperview(margin: 18)
			
			return CGSize(width: self.bubbleView.width, height: self.tailView.maxY)
			
		}
	}
	
	
	func animateIn() {
		UIView.animateWithDuration(0.45, animations: { () -> Void in
			self.transform = CGAffineTransformIdentity
			self.alpha = 1.0
			}) { (finished: Bool) -> Void in
				UIView.animateWithDuration(0.25, animations: { () -> Void in
					self.showsTail = true
					self.setNeedsLayout()
					self.layoutIfNeeded()
				})
			
		}
	}

}
