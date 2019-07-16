//
//  CallDetailsModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import CoreData

/// This class is responsable for manipulating the persistence store.
struct CallDetailsModel {

	/// Call identifier.
	let callId: Int

	/// `CoreData` managed object context.
	fileprivate var managedObjectContext: NSManagedObjectContext

	/// `CoreData` managed object model.
	fileprivate var managedObjectModel: NSManagedObjectModel

	/**

	`CallListModel` custom initializer.

	- Parameters:
	  - managedObjectContext: `CoreData` managed object context to use.
	  - managedObjectModel: `CoreData` managed object model to use.
	  - callId: Call identifier.

	- Returns: `CallListModel` initialized and ready to be use.

	*/
	init(
		managedObjectContext: NSManagedObjectContext,
		managedObjectModel: NSManagedObjectModel,
		callId: Int
		) {
		self.managedObjectContext = managedObjectContext
		self.managedObjectModel = managedObjectModel
		self.callId = callId
	}

}
