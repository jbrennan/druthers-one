//
//  EntityInspectorTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewCell: UITableViewCell, GestureControllerDelegate {

	var draggableActionView: EntityInspectorCellActionView
	var scrubbableValueView: EntityInspectorCellScrubbableValueView
	let cloningGestureController: CloningGestureController
	
	weak var delegate: EntityInspectorTableViewCellDelegate?
	
	var entity: Entity?
	
	var entityTitle: String {
		get {
			return self.draggableActionView.titleView.entityTitleLabel.text ?? ""
		}
		
		set {
			self.draggableActionView.titleView.entityTitleLabel.text = newValue
			self.setNeedsLayout()
		}
	}
	
	
	/** The title of the thing being inspected. */
	var inspectedTitle: String {
		get {
			return self.draggableActionView.titleView.entityPropertyTitleLabel.text ?? ""
		}
		
		set {
			self.draggableActionView.titleView.entityPropertyTitleLabel.text = newValue
			self.setNeedsLayout()
		}
	}
	
	var intValueWhenDragBegan: Int?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		
		self.draggableActionView = EntityInspectorCellActionView(frame: CGRect())
		self.scrubbableValueView = EntityInspectorCellScrubbableValueView(frame: CGRect())
		
		let canvasView = UIApplication.sharedApplication().rootViewController()?.view
		self.cloningGestureController = CloningGestureController(gestureView: self.draggableActionView, canvasView: canvasView!)
		self.cloningGestureController.excludedViews.append(self.scrubbableValueView)
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.cloningGestureController.gestureControllerDelegate = self
		
		self.contentView.addSubview(self.draggableActionView)
		self.contentView.addSubview(self.scrubbableValueView)
		
		UIPanGestureRecognizer(target: self, action: "panDidRecognize:", view: self.scrubbableValueView)
		
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.draggableActionView.sizeToFit()
		self.draggableActionView.x = 0
		
		// Subclasses may do as they please with the scrubber view.
	}
	
	
	// MARK: - Gesture recognizers
	
	/** Returns the current value as an int. Subclasses should implement. */
	func valueAsInt() -> Int {
		return 0
	}
	
	
	/** Updates the display labels. Subclasses should implement. */
	func updateLabels() {
		// no-op.
	}
	
	
	func panDidRecognize(recognizer: UIPanGestureRecognizer) {
		let view = recognizer.view
		
		switch recognizer.state {
		case .Began:
			self.intValueWhenDragBegan = self.valueAsInt()
		case .Changed:
			if let window = self.window {
				let rootView = window.rootViewController?.view
				let offsetX = recognizer.translationInView(rootView!).x / 2.0
				
				self.updateValueAsInt(self.intValueWhenDragBegan! + Int(offsetX))
				self.notifyDelegateValueDidUpdate()
				self.updateLabels()
			}
		case .Cancelled:
			fallthrough
		case .Failed:
			fallthrough
		case .Ended:
			self.intValueWhenDragBegan = nil
		default:
			break
		}
	}
	
	
	/** Called when the value has been updated by the pan gesture recognizer. */
	func updateValueAsInt(updatedIntValue: Int) {
		// no-op, subclasses should implement.
	}
	
	/** Called after the value is updated to notify the delegate however you please. */
	func notifyDelegateValueDidUpdate() {
		// no-op, subclasses should implement.
	}
	
	
	// MARK: - GestureControllerDelegate
	
	/** Called when the view is tapped. */
	func viewWasTapped() {
		// ILB
	}
	
	/** Called when the view starts dragging. */
	func viewDidStartDragging() {
		// ILB
	}
	
	/** Called continuously as the view is panned. */
	func viewWasPanned() {
		// ILB
	}
	
	/** Called when the view ends dragging. */
	func viewDidEndDragging(droppedView: UIView?) {
		// For subclasses to implement
	}
	


}


protocol EntityInspectorTableViewCellDelegate: class {
	
	/** Called when the user updates the value in the inspector cell. */
	func propertyDidChange(updatedProperty: EntityProperty)
	
	/** Called when the play button is pressed on an action. The delegate should play the action. */
	func playButtonWasPressedForAction(action: EntityAction)
}
