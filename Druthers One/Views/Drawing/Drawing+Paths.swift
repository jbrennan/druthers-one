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
		if self.strokes.count < 1 && self.currentStroke == nil {
			return nil
		}
		
		var paths = [UIBezierPath]()
		for drawingStroke in self.strokes {
			if let strokePath = drawingStroke.strokePath {
				paths.append(strokePath)
			}
		}
		
		if let currentStroke = self.currentStroke {
			if let strokePath = currentStroke.strokePath {
				paths.append(strokePath)
			}
		}
		
		return paths
		
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