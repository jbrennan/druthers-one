//
//  EntityInspectorTableViewController.swift
//  Druthers One
//
//  Created by Jason Brennan on Oct-28-2014.
//  Copyright (c) 2014 Khan Academy. All rights reserved.
//

import UIKit

class EntityInspectorTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.registerClass(UITableViewCell.self)
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
	
	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.reuseIdentifier(), forIndexPath: indexPath) as UITableViewCell

        cell.textLabel.text = "row \(indexPath.row + 1)"

        return cell
    }

}
