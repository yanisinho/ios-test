//
//  CallListCoordinator.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import Foundation
import Moya
import CoreData

final class CallListCoordinator: Coordinator {

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
	weak var parentCoordinator: AppCoordinator?

	/// An array of coordinators that are children of the current coordinator.
	var childCoordinators: [Coordinator] = [Coordinator]()

	/// Current navigation controller.
	var navigationController: UINavigationController

	// MARK: - Initializer

	/**

	`CallListCoordinator` custom initializer.

	- Parameters:
		- navigationController: Application's navigation controller.
		- managedObjectContext: CoreData's managed object context.
		- managedObjectModel: CoreData's managed object model.
		- provider: Moya provider to use.
		- decoder: JSON decoder to use with provider.

	- Returns: `CallListCoordinator` initialized and ready to be use.

	*/
	init(
		navigationController: UINavigationController,
		managedObjectContext: NSManagedObjectContext,
		managedObjectModel: NSManagedObjectModel,
		provider: MoyaProvider<Aircall>,
		decoder: JSONDecoder
	) {
		self.navigationController = navigationController
		self.managedObjectContext = managedObjectContext
		self.managedObjectModel = managedObjectModel
		self.provider = provider
		self.decoder = decoder
	}

	/// Start the current coordinator.
	func start() {

	}

}

// MARK: - Navigation

extension CallListCoordinator: ShowCallDetails {

	/// Accessing to call details scene.
	func showCallDetails(
		with callId: Int
		) {

	}

}
