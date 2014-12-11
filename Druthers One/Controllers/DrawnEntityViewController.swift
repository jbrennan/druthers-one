//
//  DrawnEntityViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Dec-10-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

/** This entity view controller has a custom costume. */
class DrawnEntityViewController: EntityViewController {
	
	var costume: Drawing
	
	init(entity: Entity, costume: Drawing) {
		self.costume = costume
		super.init(entity: entity)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		self.view = DrawnEntityView(drawing: self.costume)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

	}

}
