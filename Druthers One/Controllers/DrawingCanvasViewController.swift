//
//  DrawingCanvasViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit


/** Where you're limited only by your imagination. and my computer graphics skills. */
class DrawingCanvasViewController: UIViewController {
	
	var canvasViewController: CanvasViewController?
	weak var delegate: DrawingCanvasViewControllerDelegate?
	
	var swatches = [SwatchView]()
	var selectedSwatch: SwatchView? = nil
	let doneButton = Button(imageName: "done-button")

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()
		
		self.canvasViewController = CanvasViewController(nibName: nil, bundle: nil)
		self.beginShowingChildViewController(self.canvasViewController!)
		
		UITapGestureRecognizer(target: self, action: "didTap", view: self.doneButton) // hack for now
		
		for color in UIColor.KhanSwatches() {
			let swatch = SwatchView(swatchColor: color)
			self.view.addSubview(swatch)
			self.swatches.append(swatch)
			
			swatch.tappedAction = {
				[weak self] in
				if let strongSelf = self {
					strongSelf.selectSwatchView(swatch)
				}
			}
		}
		
		self.selectSwatchView(self.swatches.first!)
		
		self.view.addSubview(self.doneButton)
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let canvasView = self.canvasViewController?.view
		canvasView?.frameSize = CGSize(width: 400, height: 400)
		canvasView?.moveToCenterOfSuperview()
		
		var y = CGFloat(70)
		for swatchView in self.swatches {
			swatchView.sizeToFit()
			swatchView.x = 40
			swatchView.y = y
			y = swatchView.maxY + 30
		}
		
		self.doneButton.sizeToFit()
		
		if let canvasView = canvasView {
			self.doneButton.moveAboveSiblingView(canvasView, margin: 10)
			self.doneButton.x = canvasView.x
		}
	}
	
	
	func didTap() {
		self.delegate?.didFinishDrawing(self.canvasViewController!.drawing)
	}
	
	
	func selectSwatchView(swatchView: SwatchView) {
		if let canvasViewController = self.canvasViewController {
			canvasViewController.strokeColor = swatchView.swatchColor
		}
		self.selectedSwatch = swatchView
		self.updateSwatchViews()
		
	}
	
	func updateSwatchViews() {
		for swatchView in self.swatches {
			swatchView.selected = swatchView == self.selectedSwatch
		}
	}

}


protocol DrawingCanvasViewControllerDelegate: NSObjectProtocol {
	func didFinishDrawing(drawing: Drawing)
}
