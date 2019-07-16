//
//  CallDetailsModel+FetchRequest.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import CoreData

extension CallDetailsModel {

	struct FetchRequest {

		/**

		Build approriate fetchRequest from parameters.

		- Parameters:
		  - parameter: Parameter to use with the fetch request.
		  - managedObjectModel: Managed object to model to search in.

		- Returns: Fetch request ready to be used.

		*/
		static func requestBuilder(
			parameter: CallDetailsModel.Parameter,
			managedObjectModel: NSManagedObjectModel
			) -> NSFetchRequest<CDCall> {

			guard let fetchRequest = managedObjectModel.fetchRequestFromTemplate(
				withName: CDCall.Scope.all.key,
				substitutionVariables: [:]
				) as? NSFetchRequest<CDCall> else {
					fatalError("fetchRequest type is not NSFetchRequest<CDCall> as expected.")
			}
			let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
			fetchRequest.sortDescriptors = [sortDescriptor]

			let predicates: [NSPredicate] = [
				fetchRequest.predicate,
				NSPredicate(format: "id = %i", parameter.callId)
				].compactMap {$0}
			fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

			return fetchRequest
		}

	}

}
