//
//  PopoverViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
	
	var contentViewController: UIViewController? {
		didSet {
			if let contentViewController = contentViewController {
				self.beginShowingChildViewController(contentViewController)
				self.view.setNeedsLayout()
			}
		}
	}
	
	// I'm not entirely sure why I need these initializers, considering I have one optional var property...
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	convenience override init() {
		self.init(nibName: nil, bundle: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.orangeColor()
	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.contentViewController?.view.frame = self.view.bounds
	}

}
