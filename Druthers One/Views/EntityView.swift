//
//  EntityView.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityView: UIView, NSCopying {

	func copyWithZone(zone: NSZone) -> AnyObject {
		let copy = UIView(frame: CGRect())
		copy.bounds = self.bounds
		copy.center = self.center
		copy.transform = self.transform
		copy.backgroundColor = self.backgroundColor
		
		return copy
	}

}
