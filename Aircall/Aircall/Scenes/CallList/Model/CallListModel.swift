//
//  CallListModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import CoreData
import RxSwift
import RxCoreData
import RxDataSources

/// This class is responsable for manipulating the persistence store.
final class CallListModel {

	/// `CoreData` managed object context.
	private var managedObjectContext: NSManagedObjectContext

	/// `CoreData` managed object model.
	private var managedObjectModel: NSManagedObjectModel

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
		) {
		self.managedObjectContext = managedObjectContext
		self.managedObjectModel = managedObjectModel
	}

}

// MARK: - Create

extension CallListModel {

	/**

	Save `CDCall` entities inside persistence store.

	- Parameters:
	  - calls: Calls to persist.

	*/
	func save(calls: [WSCall]) {
		calls.forEach { call in
			guard let newCall = NSEntityDescription.insertNewObject(
				forEntityName: "CDCall",
				into: managedObjectContext
				) as? CDCall else {
					print("❤️ CoreData: Couldn't insert new CDCall in persistence store.")
				return
			}
			newCall.id = Int32(call.id)
			newCall.created = call.created as NSDate
			newCall.direction = call.direction
			newCall.from = call.from
			newCall.to = call.to
			newCall.via = call.via
			newCall.duration = Int32(call.duration)
			newCall.type = call.type
			newCall.isArchived = call.isArchived
		}
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			fatalError("AppDelegate couldn't be retreived.")
		}
		appDelegate.saveContext()
	}

}

// MARK: - Read

extension CallListModel {

	/**

	Retreive `CDCall` entities from persistence store.

	- Parameters:
	  - fetchRequest: `CoreData` fetch request used to retreive entities.

	- Returns: An item which is made to populate an `UITableView` or `UICollectionView`.

	*/
	func calls(
		parameter: CallListModelParameter
		) -> Observable<[AnimatableSectionModel<String, CDCall>]> {
		let fetchRequest: NSFetchRequest<CDCall> = CallListModelFetchRequest.requestBuilder(
			parameter: parameter,
			managedObjectModel: managedObjectModel
		)
		return managedObjectContext.rx
			.entities(fetchRequest: fetchRequest)
			.map {
			return RxDataSources.animatableSections(from: $0)
		}
	}

}
