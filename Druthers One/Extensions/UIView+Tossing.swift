//
//  UIView+Tossing.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-01-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Toss the UIView right off the screen! */
extension UIView {
	
	/** Toss the receiver off screen. */
	func tossWithVelocity(velocity: CGPoint, resetViewAfterCompletion: Bool = false) {
		
		// This could be so much better. I'm not sure how to do it, though. Help?
		let velocity = Vector(point: velocity)
		if velocity.magnitude > 2500 {
			let slideFactor = 0.01 * (velocity.magnitude / 200.0)
			var restingCenter = CGPoint(x: self.centerX + (velocity.x * slideFactor), y: self.centerY + (velocity.y * slideFactor))
			
			
			
			UIView.animateWithDuration(NSTimeInterval(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
				self.center = restingCenter
				}, completion: { (finished: Bool) -> Void in
					if resetViewAfterCompletion {
						self.center = CGPoint(x: 300, y: 300)
					}
			})
		}
	}
}
