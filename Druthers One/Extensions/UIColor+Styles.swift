//
//  UIColor+Styles.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension UIColor {
	
	/** 
	Initialize a colour with HSB values given as integers on their more logical range.
	
	@param hue A number between 0..360
	@param saturation An integer between 0..100
	@param brightness An integer between 0..100
	
	*/
	convenience init(hue: Int = 0, saturation: Int = 0, brightness: Int = 0) {
		self.init(hue: CGFloat(hue) / 360.0, saturation: CGFloat(saturation) / 100.0, brightness: CGFloat(brightness) / 100.0, alpha: 1.0)
	}
	
	class func KhanTextColor() -> UIColor {
		return UIColor(hue: 285, saturation: 0, brightness: 29)
	}
	
	
	class func KhanLightGreyColor() -> UIColor {
		return UIColor(brightness: 93)
	}
	
	
	class func KhanMediumGreyColor() -> UIColor {
		return UIColor(brightness: 59)
	}
}
