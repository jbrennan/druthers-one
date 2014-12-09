//
//  PsstViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-05-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class PsstViewController: UIViewController, TouchInterceptor {
	
	weak var delegate: PsstViewControllerDelegate?
	
	var containerView: PsstContainerView {
		return self.view as PsstContainerView
	}
	
	override func loadView() {
		self.view = PsstContainerView(frame: CGRect())
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.containerView.speechBubbleView)
		
		delayInSeconds(1) {
			self.containerView.speechBubbleView.showText("psst...")
			self.containerView.speechBubbleView.animateIn() {
				self.containerView.sizeToFit()
			}
			
			
		}
    }
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.containerView.speechBubbleView.sizeToFit()
	}
	
	
	func screenWasTapped() {
		
		if !self.containerView.showingPsst {
			self.containerView.showPsst()
			self.containerView.showText("Tap me to make a drawing")
			return
		}
		
		self.delegate?.showDrawingCanvas()
	}
	
	
	func shouldReceiveTouch(touch: UITouch) -> Bool {
		return self.view.pointInside(touch.locationInView(self.view), withEvent: nil)
	}

}


protocol PsstViewControllerDelegate: NSObjectProtocol {
	func showDrawingCanvas()
}
