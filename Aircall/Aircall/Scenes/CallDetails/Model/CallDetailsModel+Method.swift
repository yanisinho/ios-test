//
//  CallDetailsModel+Method.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import CoreData
import RxSwift

extension CallDetailsModel {

	/**

	Update `CDCall` entitiy inside persistence store.

	- Parameters:
	  - call: Call to persist.

	*/
	func update(call: WSCall) {
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
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			fatalError("AppDelegate couldn't be retreived.")
		}
		appDelegate.saveContext()
	}

	/**

	Retreive `CDCall` entity from persistence store.

	- Parameters:
	  - fetchRequest: `CoreData` fetch request used to retreive entities.

	- Returns: An item which is made to populate an `UITableView` or `UICollectionView`.

	*/
	func read(
		parameter: CallDetailsModel.Parameter
		) -> Observable<CDCall?> {
		let fetchRequest: NSFetchRequest<CDCall> = CallDetailsModel.FetchRequest.requestBuilder(
			parameter: parameter,
			managedObjectModel: managedObjectModel
		)
		return managedObjectContext.rx
			.entities(fetchRequest: fetchRequest)
			.map {$0.first}
	}

}
