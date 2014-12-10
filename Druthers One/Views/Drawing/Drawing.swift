//
//  Drawing.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import Foundation
import CoreGraphics


struct Drawing {
	let strokes: [DrawingStroke]
	let currentStroke: DrawingStroke?
	
	func drawingByAddingStroke(stroke: DrawingStroke) -> Drawing {
		return Drawing(strokes: self.strokes + [stroke], currentStroke: nil)
	}
	
	
	func drawingByUpdatingCurrentStroke(currentStroke: DrawingStroke) -> Drawing {
		return Drawing(strokes: self.strokes, currentStroke: currentStroke)
	}
}


struct DrawingStroke {
	let touchSamples: [DrawingTouchSample]
	
	
	func strokeByAddingTouchSample(touchSample: DrawingTouchSample) -> DrawingStroke {
		return DrawingStroke(touchSamples: self.touchSamples + [touchSample])
	}
}


struct DrawingTouchSample {
	let location: CGPoint
	let timestamp: NSTimeInterval
}