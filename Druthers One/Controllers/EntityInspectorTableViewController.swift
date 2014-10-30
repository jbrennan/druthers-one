//
//  EntityInspectorTableViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewController: UITableViewController, EntityInspectorTableViewCellDelegate {
	
	private enum EntityInspectorSection: Int {
		case Data = 0
		case Actions
		
		var sectionTitle: String {
			switch self {
			case .Data:
				return "Data"
				
			case .Actions:
				return "Actions"
			}
		}
		
		
		var cellClass: AnyClass {
			switch self {
			case .Data:
				return EntityInspectorTableViewCell.self
				
			case .Actions:
				return EntityInspectorActionTableViewCell.self
			}
		}
	}
	
	weak var entityController: EntityController? // I'm having a hard time getting this to work with initializers, so I'm just making it an optional and setting it directly...HACK WEEK!
	
	private var entity: Entity? {
		return self.entityController?.entity
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.registerClass(EntityInspectorSection.Data.cellClass)
		self.tableView.registerClass(EntityInspectorSection.Actions.cellClass)
		
		self.tableView.allowsSelection = false
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let entity = self.entity {
			if section == EntityInspectorSection.Data.rawValue {
				return entity.properties.count
			} else {
				let count = entity.actions.count
				return count

			}
		}
		return 0
    }
	
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let section = EntityInspectorSection(rawValue: indexPath.section)!
		
		switch section {
		case .Data:
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
		case .Actions:
			let cell = tableView.dequeueReusableCellWithIdentifier(EntityInspectorActionTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as EntityInspectorActionTableViewCell
			
			if let entity = self.entity {
				cell.draggableTitleView.entityTitleLabel.text = "\(entity.title)"
				cell.draggableTitleView.entityPropertyTitleLabel.text = entity.actions[indexPath.row].title
			}
			
			return cell
		}
		
    }
	
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return EntityInspectorSection(rawValue: section)?.sectionTitle
	}
	
	
	func propertyDidChange(updatedProperty: EntityProperty) {
		self.entityController?.entityPropertyWasUpdated(updatedProperty)
	}

}
