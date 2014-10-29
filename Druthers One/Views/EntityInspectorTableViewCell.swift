//
//  EntityInspectorTableViewCell.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-29-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewCell: UITableViewCell {

	var draggableTitleView: EntityInspectorCellDraggableTitleView
	var scrubbableValueView: UIView
	
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		
		self.draggableTitleView = EntityInspectorCellDraggableTitleView(frame: CGRect())
//		self.draggableTitleView.backgroundColor = UIColor.purpleColor()
		self.draggableTitleView.entityTitleLabel.text = "block's"
		self.draggableTitleView.entityPropertyTitleLabel.text = "x"
		
		self.scrubbableValueView = UIView(frame: CGRect())
		self.scrubbableValueView.backgroundColor = UIColor.orangeColor()
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.contentView.addSubview(self.draggableTitleView)
		self.contentView.addSubview(self.scrubbableValueView)
		
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.draggableTitleView.sizeToFit()
		self.scrubbableValueView.sizeToFit()

		
		self.draggableTitleView.x = 0
		self.scrubbableValueView.moveToRightSideOfSuperview()
	}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
