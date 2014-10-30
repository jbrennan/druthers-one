//
//  EntityInspectorTableViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewController: UITableViewController, EntityInspectorTableViewCellDelegate {
	
	weak var entityController: EntityController? // I'm having a hard time getting this to work with initializers, so I'm just making it an optional and setting it directly...HACK WEEK!
	
	private var entity: Entity? {
		return self.entityController?.entity
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.registerClass(EntityInspectorTableViewCell.self)
		self.tableView.allowsSelection = false
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let entity = self.entity {
			if section == 0 {
				return entity.properties.count
			} else {
				return entity.actions.count
			}
		}
		return 0
    }
	
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EntityInspectorTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as EntityInspectorTableViewCell

		if let entity = self.entity {
			cell.entityTitle = "\(entity.title)’s"
			cell.property = entity.properties[indexPath.row]
			
		} else {
			cell.entityTitle = "entity’s"
			cell.property = nil
		}
		
		cell.delegate = self
        return cell
    }
	
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		switch section {
		case 0:
			return "Data"
		case 1:
			return "Actions"
			
		default:
			return nil
		}
	}
	
	
	func propertyDidChange(updatedProperty: EntityProperty) {
		self.entityController?.entityPropertyWasUpdated(updatedProperty)
	}

}
