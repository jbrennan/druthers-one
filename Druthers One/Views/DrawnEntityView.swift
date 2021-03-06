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
			let widthOffset = -DrawingStroke.strokeWidth / 2.0
			return CGRectInset(bounds, widthOffset, widthOffset).size
		}
		
		return size
	}
	
	
	override func drawRect(rect: CGRect) {
		
		// Redrawing these every time is obviously wasteful.
		let bounds = self.drawing.drawingBounds
		let widthOffset = DrawingStroke.strokeWidth / 2.0
		let transform = CGAffineTransformMakeTranslation(-bounds!.minX + widthOffset, -bounds!.minY + widthOffset)
		if let strokes = self.drawing.renderableStrokes {
			
			
			for stroke in strokes {
				
				let path = stroke.strokePath
				path?.applyTransform(transform)
				path?.lineWidth = DrawingStroke.strokeWidth
				path?.lineJoinStyle = kCGLineJoinRound
				
				let color = stroke.strokeColor
				color.setStroke()
				path?.stroke()
			}
		}
	}

}
