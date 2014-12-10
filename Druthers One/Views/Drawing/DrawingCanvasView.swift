//
//  DrawingCanvasView.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class DrawingCanvasView: UIView {
	
	var drawing: Drawing = Drawing(strokes: [], currentStroke: nil) {
		didSet {
			self.setNeedsDisplay()
		}
	}


    override func drawRect(rect: CGRect) {
		
		// Redrawing these every time is obviously wasteful.
		if let paths = self.drawing.strokePaths {
			for path in paths {
				path.lineWidth = 10
				path.lineJoinStyle = kCGLineJoinRound
				path.stroke()
			}
		}
    }

}
