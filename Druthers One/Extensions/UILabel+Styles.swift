//
//  UILabel+Styles.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit


extension UILabel {
	
	enum FontWeight {
		case Normal
		case Bold
		
		func fontForFontSize(size: CGFloat) -> UIFont? {
			return UIFont(name: self.fontName(), size: size)?
		}
		
		private func fontName() -> String {
			switch self {
			case .Normal:
				return "ProximaNova-Regular"
				
			case .Bold:
				return "ProximaNova-Semibold"
			}
		}
	}
	
	
	/** Convenience initializer to style the label in standard Khan Academy garb. */
	convenience init(text: String? = nil, fontSize: CGFloat = 16.0, fontWeight: FontWeight = .Normal) {
		self.init(frame: CGRect())
		
		self.text = text
		self.font = fontWeight.fontForFontSize(fontSize)
		self.textColor = UIColor.KhanTextColor()
	}
	
	
	// TODO(jasonb): I'd love to eventually have a kind of "FontStyle" for things like Header, title, label, body text, etc. that incorporated a standard set of font sizes and weights.
}
