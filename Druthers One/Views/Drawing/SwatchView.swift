//
//  SwatchView.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-17-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** This class has colour swatches. */
class SwatchView: UIView {
	
	let swatchColor: UIColor
	let circle: UIView // eventually we want different sizes
	
	var tappedAction: ActionBlock?
	
	init(swatchColor: UIColor) {
		self.swatchColor = swatchColor
		self.circle = UIView(frame: CGRect())
		self.circle.backgroundColor = swatchColor
		
		super.init(frame: CGRect())
		
		self.addSubview(self.circle)
		
		UITapGestureRecognizer(target: self, action: "tapped", view: self)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		return CGSize(width: 60, height: 60)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.circle.frame = self.bounds
		self.circle.roundCorners()
	}
	
	
	func tapped() {
		if let tappedAction = self.tappedAction {
			tappedAction()
		}
	}

}
