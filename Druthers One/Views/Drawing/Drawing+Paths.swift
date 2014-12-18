//
//  Drawing+Paths.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

extension Drawing {
	
	var strokePaths: [UIBezierPath]? {
		return self.renderableStrokes?.map {
			(stroke: DrawingStroke) -> UIBezierPath in
			
			return stroke.strokePath!
		}
	}
	
	
	/** An array of strokes for rendering. */
	var renderableStrokes: [DrawingStroke]? {
		var strokes = self.strokes
		
		if let currentStroke = self.currentStroke {
			strokes.append(currentStroke)
		}
		
		if strokes.count > 0 {
			return strokes
		}
		
		return nil
	}
	
	
	/** Returns the bounds enclosing the entire drawing. */
	var drawingBounds: CGRect? {
		if let paths = self.strokePaths {
			var bounds = CGRect()
			
			for (index, path) in enumerate(paths) {
				if index == 0 {
					bounds = path.bounds
				} else {
					bounds = CGRectUnion(bounds, path.bounds)
				}
			}
			
			return bounds
		}
		
		return nil
	}
	
	
	// TODO: try to return a combined path of all the strokes so we can make a better shadow.
	var combinedPath: UIBezierPath? {
		if let paths = self.strokePaths {
			
		}
		
		return nil
	}
}


extension DrawingStroke {
	
	var strokePath: UIBezierPath? {
		if self.touchSamples.count < 1 {
			return nil
		}
		
		// Super basic path drawing here for now. We can smooth this later.
		let path = UIBezierPath()
		
		for (index, touchSample) in enumerate(self.touchSamples) {
			if index == 0 {
				path.moveToPoint(touchSample.location)
				
			} else {
				path.addLineToPoint(touchSample.location)
			}
		}
		
		return path
	}
}