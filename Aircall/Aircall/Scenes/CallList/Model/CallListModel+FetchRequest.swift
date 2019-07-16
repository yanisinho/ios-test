//
//  CallListModel+FetchRequest.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import CoreData

extension CallListModel {

	struct FetchRequest {

		/**

		Build approriate fetchRequest from parameters.

		- Parameters:
		  - parameter: Parameter to use with the fetch request.
		  - managedObjectModel: Managed object to model to search in.

		- Returns: Fetch request ready to be used.
		
		*/
		static func build(
			parameter: CallListModel.Parameter,
			managedObjectModel: NSManagedObjectModel
			) -> NSFetchRequest<CDCall> {
			guard let fetchRequest = managedObjectModel.fetchRequestFromTemplate(
				withName: parameter.scope.key,
				substitutionVariables: [:]
				) as? NSFetchRequest<CDCall> else {
					fatalError("fetchRequest type is not NSFetchRequest<CDCall> as expected.")
			}
			let sortDescriptor = NSSortDescriptor(key: "created", ascending: parameter.ascending)
			fetchRequest.sortDescriptors = [sortDescriptor]
			return fetchRequest
		}

	}

}
