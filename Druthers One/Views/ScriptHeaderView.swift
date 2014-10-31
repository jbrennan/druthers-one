//
//  ScriptHeaderView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class ScriptHeaderView: UIView {

	let playButton: Button
	let repeatButton: Button
	let titleLabel = UILabel(text: "Script", fontSize: 18, fontWeight: .Bold)
	
	
	override init(frame: CGRect) {
		self.playButton = Button(imageName: "play")
		self.repeatButton = Button(imageName: "replay")
		
		super.init(frame: frame)
		
		self.addSubview(self.playButton)
		self.addSubview(self.repeatButton)
		self.addSubview(self.titleLabel)
	}
	

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		return CGSize(width: 300, height: 44)
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let margin = CGFloat(10.0)
		
		self.playButton.sizeToFit()
		self.playButton.moveToVerticalCenterOfSuperview()
		self.playButton.x = margin
		
		self.titleLabel.sizeToFit()
		self.titleLabel.moveToCenterOfSuperview()
		
		self.repeatButton.sizeToFit()
		self.playButton.moveToVerticalCenterOfSuperview()
		self.playButton.moveToRightSideOfSuperview(margin: margin)
	}

}
