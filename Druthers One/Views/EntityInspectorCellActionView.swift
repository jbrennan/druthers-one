//
//  EntityInspectorCellActionView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorCellActionView: UIView, NSCopying {
	
	var playButton: Button? = Button(image: UIImage(named: "play"))
	let titleView = EntityInspectorCellDraggableTitleView(frame: CGRect())
	var inputViews = [EntityInspectorCellScrubbableValueView]() // probably just one for now, but in theory we can have many
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.addSubview(self.playButton!)
		self.addSubview(self.titleView)
		self.backgroundColor = UIColor.KhanLightGreyColor()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	func copyWithZone(zone: NSZone) -> AnyObject {
		let copy = EntityInspectorCellActionView(frame: self.frame)
		copy.titleView.entityTitleLabel.text = self.titleView.entityTitleLabel.text
		copy.titleView.entityPropertyTitleLabel.text = self.titleView.entityPropertyTitleLabel.text
		
		// TODO: Should really copy the views or something...
		for input in self.inputViews {
			copy.addInputView(input)
		}
		return copy
	}
	
	
	func addInputView(view: EntityInspectorCellScrubbableValueView) {
		self.inputViews.append(view)
		self.addSubview(view)
	}
	
	
	func removePlayButton() {
		self.playButton?.removeFromSuperview()
		self.playButton = nil
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
			
			self.playButton?.sizeToFit()
			self.playButton?.x = margin
			self.playButton?.moveToVerticalCenterOfSuperview()
			
			self.titleView.sizeToFit()
			
			if let playButton = self.playButton {
				self.titleView.moveToRightOfSiblingView(playButton, margin: 5)
			} else {
				self.titleView.x = 0
			}
			
			var maxX = self.titleView.maxX
			for inputView in self.inputViews {
				inputView.sizeToFit()
				inputView.x = maxX
				maxX = inputView.maxX
				
				inputView.moveToVerticalCenterOfSuperview()
			}

			
			return CGSize(width: maxX, height: 44.0)
			
		}
	}
	
}
