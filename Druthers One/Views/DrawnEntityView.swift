//
//  DrawnEntityView.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-10-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class DrawnEntityView: UIView {

	var drawing: Drawing {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	
	init(drawing: Drawing) {
		self.drawing = drawing
		super.init(frame: CGRect())
		self.backgroundColor = UIColor.clearColor()
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func sizeThatFits(size: CGSize) -> CGSize {
		
		if let bounds = self.drawing.drawingBounds {
			return CGRectInset(bounds, -10, -10).size
		}
		
		return size
	}
	
	
	override func drawRect(rect: CGRect) {
		
		// Redrawing these every time is obviously wasteful.
		if let paths = self.drawing.strokePaths {
			
			let bounds = self.drawing.drawingBounds
			let transform = CGAffineTransformMakeTranslation(-bounds!.minX + 10, -bounds!.minY + 10)
			
			for path in paths {
				path.applyTransform(transform)
				path.lineWidth = 10
				path.lineJoinStyle = kCGLineJoinRound
				path.stroke()
			}
		}
	}

}
