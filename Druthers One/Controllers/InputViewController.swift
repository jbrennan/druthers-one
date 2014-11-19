//
//  InputViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Nov-03-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** View controller for an entity action input. */
class InputViewController: UIViewController, ScrubbingGestureControllerDelegate {
	
	let entityActionInput: EntityActionInput
	var propertyView: UIView?
	
	weak var delegate: InputViewControllerDelegate?
	
	private var scrubbingGestureController: ScrubbingGestureController?
	
	var valueView: EntityInspectorCellScrubbableValueView {
		return self.view as EntityInspectorCellScrubbableValueView
	}
	
	
	var initialScrubbingNumber: Int {
		return Int(self.entityActionInput.value as CGFloat)
	}
	
	init(entityActionInput: EntityActionInput) {
		self.entityActionInput = entityActionInput
		super.init(nibName: nil, bundle: nil)
		self.scrubbingGestureController = ScrubbingGestureController(gestureView: self.view)
		self.scrubbingGestureController?.delegate = self
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		self.view = EntityInspectorCellScrubbableValueView(frame: CGRect())
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.updateViews()
	}
	
	
	func updateViews() {
		self.valueView.unitLabel.text = self.entityActionInput.pluralUnit
		self.valueView.valueLabel.text = "\(self.entityActionInput.value)"
		self.delegate?.viewDidUpdate()
	}
	
	
	func scrubberDidScrubToNumber(newValue: Int) {
		self.entityActionInput.value = CGFloat(newValue)
		self.updateViews()
	}
	
	
	func addProperty(property: EntityProperty, forDroppedView droppedView: UIView) {
		self.entityActionInput.childEvaluatable = property
		self.propertyView = droppedView
		self.valueView.propertyView = droppedView
	}

}

protocol InputViewControllerDelegate: class {
	
	/** Called when values in the interface have changed and should trigger layout to happen. */
	func viewDidUpdate()
}
