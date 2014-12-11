//
//  DrawingCanvasViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-09-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit


/** Where you're limited only by your imagination and my computer graphics skills. */
class DrawingCanvasViewController: UIViewController {
	
	var canvasViewController: CanvasViewController?
	weak var delegate: DrawingCanvasViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.whiteColor()
		
		self.canvasViewController = CanvasViewController(nibName: nil, bundle: nil)
		self.beginShowingChildViewController(self.canvasViewController!)
		
		UITapGestureRecognizer(target: self, action: "didTap", view: self.view) // hack for now
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let canvasView = self.canvasViewController?.view
		canvasView?.frameSize = CGSize(width: 400, height: 400)
		canvasView?.moveToCenterOfSuperview()
	}
	
	
	func didTap() {
		self.delegate?.didFinishDrawing(self.canvasViewController!.drawing)
	}

}


protocol DrawingCanvasViewControllerDelegate: NSObjectProtocol {
	func didFinishDrawing(drawing: Drawing)
}
