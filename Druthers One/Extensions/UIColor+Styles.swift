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
	
	
	class func KhanCanvasBackgroundColor() -> UIColor {
//		return UIColor(hue:0.087, saturation:0.091, brightness:0.996, alpha:1.0)
//		return UIColor(hue:0.111, saturation:0.457, brightness:0.953, alpha:1.0)
		return UIColor(hue:0.123, saturation:0.153, brightness:0.973, alpha:1.0) // I think I like this the best
//		return UIColor(hue:0.124, saturation:0.313, brightness:0.988, alpha:1.0)
//		return UIColor(hue: 0.067, saturation: 0.021, brightness: 0.937, alpha: 1.0)
	}
	
	
	class func KhanSpeechBubbleColor() -> UIColor {
		return UIColor(hue: 44, saturation: 11, brightness: 90)
	}
	
	
	class func KhanPsstBackgroundColor() -> UIColor {
		return UIColor(hue: 15, saturation: 65, brightness: 90)
	}
}
