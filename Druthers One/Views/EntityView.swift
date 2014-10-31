//
//  EntityView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityView: UIView, NSCopying {
	
	private let box: UIView
	
	override init(frame: CGRect) {
		self.box = UIView(frame: CGRect())
		self.box.backgroundColor = UIColor.KhanTextColor()
		super.init(frame: frame)
		
		self.addSubview(self.box)
	}
	
	
	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	func copyWithZone(zone: NSZone) -> AnyObject {
		let copy = UIView(frame: CGRect())
		copy.bounds = self.bounds
		copy.center = self.center
		copy.transform = self.transform
		copy.backgroundColor = self.backgroundColor
		
		return copy
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.box.frameSize = CGSize(width: 30, height: 30)
		self.box.moveToHorizontalCenterOfSuperview()
	}

}
