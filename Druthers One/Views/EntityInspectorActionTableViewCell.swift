//
//  EntityInspectorActionTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-30-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorActionTableViewCell: UITableViewCell {
	
	let draggableTitleView: EntityInspectorCellDraggableTitleView
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		self.draggableTitleView = EntityInspectorCellDraggableTitleView(frame: CGRect())
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.contentView.addSubview(self.draggableTitleView)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.draggableTitleView.sizeToFit()
		self.draggableTitleView.x = 0
	}
}
