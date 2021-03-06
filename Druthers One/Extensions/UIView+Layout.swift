//
//  UIView+Layout.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-27-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** Positioning views. */
extension UIView {
	
	
	/** Moves the receiver to the right of the given sibling view. */
	func moveToRightOfSiblingView(siblingView: UIView, margin: CGFloat = 0.0) {
		self.x = floor(siblingView.maxX + margin)
	}
	
	
	func moveBelowSiblingView(siblingView: UIView, margin: CGFloat = 0.0) {
		self.y = siblingView.maxY + margin
	}
	
	
	func moveAboveSiblingView(siblingView: UIView, margin: CGFloat = 0.0) {
		self.y = siblingView.y - (self.height + margin)
	}
	
	
	/** Moves the receiver so that its right side is aligned with the right side of its superview. */
	func moveToRightSideOfSuperview(margin: CGFloat = 0.0) {
		if let superview = self.superview {
			self.x = floor(superview.bounds.width - self.width - margin)
		}
	}
	
	
	func moveToVerticalCenterOfSuperview() {
		if let superview = self.superview {
			self.y = floor(superview.height / 2.0 - self.height / 2.0)
		}
	}
	
	
	func moveToHorizontalCenterOfSuperview() {
		if let superview = self.superview {
			self.x = floor(superview.width / 2.0 - self.width / 2.0)
		}
	}
	
	
	func moveToCenterOfSuperview() {
		self.moveToVerticalCenterOfSuperview()
		self.moveToHorizontalCenterOfSuperview()
	}
	
	
	/** Makes the receiver's frame be integral so there are no half-pixels. */
	func makeFrameIntegral() {
		self.frame = self.frame.integerRect
	}
}


/** Layout subviews helpers. */
extension UIView {
	
	typealias SizingLayoutBlock = (() -> CGSize)
	
	func sizeThatFitsByLayingOutSubviews(size:CGSize, commitLayout: Bool = true) -> CGSize {
		
		return size
	}
	
	func sizeThatFitsByRunningLayoutBlock(commitLayout: Bool = true, layoutBlock: SizingLayoutBlock) -> CGSize {
		
		// if we're not committing the layout, preserve subview frames
		let viewToFrameMap: NSMapTable? = commitLayout ? nil : NSMapTable.weakToWeakObjectsMapTable()
		
		if let viewToFrameMap = viewToFrameMap {
			
			for subview in self.subviews as [UIView] {
				viewToFrameMap.setObject(NSValue(CGRect: subview.frame), forKey: subview)
			}
		}
		
		let size = layoutBlock()
		
		
		// Restore subview frames if needed.
		if let viewToFrameMap = viewToFrameMap {
			
			for subview in self.subviews as [UIView] {
				let frameValue: NSValue? = viewToFrameMap.objectForKey(subview) as? NSValue
				if let frameValue = frameValue {
					subview.frame = frameValue.CGRectValue()
				}
			}
		}
		
		return size
	}
}