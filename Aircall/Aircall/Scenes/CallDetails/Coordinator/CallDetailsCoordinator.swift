//
//  CallDetailsCoordinator.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import CoreData
import Moya

final class CallDetailsCoordinator: Coordinator {

	/// Call identifier
	let callId: Int

	// MARK: - Private properties

	/// Managed object context.
	private var managedObjectContext: NSManagedObjectContext

	/// Managed object model.
	private var managedObjectModel: NSManagedObjectModel

	/// Moya provider.
	private let provider: MoyaProvider<Aircall>

	/// JSON decoder.
	private let decoder: JSONDecoder

		// MARK: - Coordinator

	/// App coordinator.
	weak var parentCoordinatorl: AppCoordinator?

	/// An array of coordinators that are children of the current coordinator.
	var childCoordinators: [Coordinator] = [Coordinator]()

	/// Current navigation controller.
	var navigationController: UINavigationController

	/// Start the current coordinator.
	func start() {

	// Prepare viewController.
		let viewController = CallDetailsViewController(
			viewModel: CallDetailsViewModel(
				provider: provider,
				decoder: decoder,
				coordinator: self,
				model: CallDetailsModel(
					managedObjectContext: managedObjectContext,
					managedObjectModel: managedObjectModel,
					callId: callId
				)
			)
		)
		viewController.coordinator = self

		// Push controller into navigation stack.
		navigationController.pushViewController(
			viewController,
			animated: true
		)

	}

	// MARK: - Initializer

	/**

	`CallDetailsCoordinator` custom initializer.

	- Parameters:
	  - navigationController: Application's navigation controller.
	  - managedObjectContext: CoreData's managed object context.
	  - managedObjectModel: CoreData's managed object model.
	  - provider: Moya provider to use.
	  - decoder: JSON decoder to use with provider.
	  - callId: Call identifier.

	- Returns: `CallListCoordinator` initialized and ready to be use.

	*/
	init(
		navigationController: UINavigationController,
		managedObjectContext: NSManagedObjectContext,
		managedObjectModel: NSManagedObjectModel,
		provider: MoyaProvider<Aircall>,
		decoder: JSONDecoder,
		callId: Int
		) {
		self.navigationController = navigationController
		self.managedObjectContext = managedObjectContext
		self.managedObjectModel = managedObjectModel
		self.provider = provider
		self.decoder = decoder
		self.callId = callId
	}

}
