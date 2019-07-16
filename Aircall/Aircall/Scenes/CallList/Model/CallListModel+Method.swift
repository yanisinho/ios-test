//
//  CallListModel+Method.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import CoreData
import RxCoreData
import RxSwift
import RxDataSources

extension CallListModel {

	/**

	Update `CDCall` entities inside persistence store.

	- Parameters:
	  - calls: WSCall items to persist.

	*/
	@discardableResult func update(calls: [WSCall]) -> Bool {
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
			print("❤️ CoreData: Couldn't not retreive AppDelegate and saveContext.")
			return false
		}
		appDelegate.saveContext()
		return true
	}

	/**

	Read `CDCall` entities from persistence store.

	- Parameters:
	  - parameter: Parameter to use with the fetch request.

	- Returns: An item which is made to populate an `UITableView` or `UICollectionView`.

	*/
	func read(
		parameter: CallListModel.Parameter
		) -> Observable<[AnimatableSectionModel<String, CDCall>]> {
		let fetchRequest: NSFetchRequest<CDCall> = CallListModel.FetchRequest.build(
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
