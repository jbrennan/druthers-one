//
//  BlockViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-31-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {
	
	let blockView = EntityInspectorCellActionView(frame: CGRect())
	let action: EntityAction
	
	init(action: EntityAction) {
		self.action = action
		super.init(nibName: nil, bundle: nil)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.addSubview(self.blockView)
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.blockView.sizeToFit()
	}

}
