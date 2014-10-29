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
		self.x = siblingView.maxX + margin
	}
	
	
	/** Moves the receiver so that its right side is aligned with the right side of its superview. */
	func moveToRightSideOfSuperview(margin: CGFloat = 0.0) {
		if let superview = self.superview {
			self.x = superview.bounds.width - self.width - margin
		}
	}
	
	
	func moveToVerticalCenterOfSuperview() {
		if let superview = self.superview {
			self.y = superview.height / 2.0 - self.height / 2.0
		}
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