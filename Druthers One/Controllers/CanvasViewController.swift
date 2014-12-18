//
//  CanvasViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

	
	let panGestureRecognizer: DrawingGestureRecognizer?
	var drawing = Drawing(strokes: [], currentStroke: nil)
	var currentStroke: DrawingStroke?
	
	var strokeColor = UIColor.blackColor()
	
	var canvasView: DrawingCanvasView {
		return self.view as DrawingCanvasView
	}
	
	
	required override init(nibName: String?, bundle: NSBundle?) {
		super.init(nibName: nibName, bundle: bundle)
		
		self.panGestureRecognizer = DrawingGestureRecognizer(target: self, action: "panDidRecognize:")
		
		self.view.addGestureRecognizer(self.panGestureRecognizer!)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		self.view = DrawingCanvasView(frame: CGRect())
	}

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = UIColor.whiteColor()
		self.view.borderWidth = 2
    }
	
	
	func panDidRecognize(recognizer: DrawingGestureRecognizer) {
		
		let location = recognizer.activeTouch?.locationInView(recognizer.view)
		let timestamp = recognizer.activeTouch?.timestamp
		
		switch recognizer.state {
		case .Began:
			let touchSample = DrawingTouchSample(location: location!, timestamp: timestamp!)
			self.currentStroke = DrawingStroke(touchSamples: [touchSample], strokeColor: self.strokeColor)
			self.drawing = self.drawing.drawingByUpdatingCurrentStroke(self.currentStroke!)
			
		case .Changed:
			let touchSample = DrawingTouchSample(location: location!, timestamp: timestamp!)
			self.currentStroke = self.currentStroke?.strokeByAddingTouchSample(touchSample)
			self.drawing = self.drawing.drawingByUpdatingCurrentStroke(self.currentStroke!)
			
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			self.drawing = self.drawing.drawingByAddingStroke(self.currentStroke!)
			self.currentStroke = nil
			
		default:
			break
		}
		
		self.canvasView.drawing = self.drawing
		self.view.setNeedsDisplay()
	}

	

}
