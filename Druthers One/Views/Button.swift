//
//  Button.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

typealias ActionBlock = () -> ()

/** Not a real button because UIButton is weird about subclassing in Swift? I'd love to figure that one out. */
class Button: UIImageView {
	
	var tapAction: ActionBlock?
	
	override init(image: UIImage!) {
		super.init(image: image)
		
		UITapGestureRecognizer(target: self, action: "tap", view: self)
		self.userInteractionEnabled = true
	}
	
	
	convenience init(imageName: String) {
		self.init(image: UIImage(named: imageName))
	}

	required init(coder aDecoder: NSCoder) {
	    super.init(coder: aDecoder)
	}
	
	
	func tap() {
		if let actionBlock = self.tapAction {
			actionBlock()
		}
	}
	
}
