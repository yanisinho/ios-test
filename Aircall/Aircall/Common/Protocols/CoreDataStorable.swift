//
//  CoreDataStorable.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import CoreData

protocol CoreDataStorable {

	/// `CoreData` managed object context.
	var managedObjectContext: NSManagedObjectContext { get set }

	/// `CoreData` managed object model.
	var managedObjectModel: NSManagedObjectModel { get set }

	/**

	`CallListModel` custom initializer.

	- Parameters:
		- managedObjectContext: `CoreData` managed object context to use.
		- managedObjectModel: `CoreData` managed object model to use.

	- Returns: `CallListModel` initialized and ready to be use.

	*/
	init(
		managedObjectContext: NSManagedObjectContext,
		managedObjectModel: NSManagedObjectModel
	)

}
