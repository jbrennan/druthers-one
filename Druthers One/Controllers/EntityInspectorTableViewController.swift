//
//  EntityInspectorTableViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewController: UITableViewController {
	
	weak var entityController: EntityController? // I'm having a hard time getting this to work with initializers, so I'm just making it an optional and setting it directly...HACK WEEK!
	
	private var entity: Entity? {
		return self.entityController?.entity
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.registerClass(EntityInspectorTableViewCell.self)
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let entity = self.entity {
			return entity.properties.count
		}
		return 0
    }
	
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(EntityInspectorTableViewCell.reuseIdentifier(), forIndexPath: indexPath) as UITableViewCell
		
		if let properties = self.entity?.properties {
			let keys = Array(properties.keys)
			let propertyKey = keys[indexPath.row]
			let value = properties[propertyKey]
			if let value = value {
				
//				cell.textLabel.text = "\(propertyKey): \(value)"
			}
		}
        return cell
    }
	
	override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Data"
		}
		return nil
	}

}
