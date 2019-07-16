//
//  AppCoordinator.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Moya

/// Application main coordinator.
final class AppCoordinator: NSObject, Coordinator {

	// MARK: - Coordinator

	/// An array of coordinators that are children of the current coordinator.
	var childCoordinators = [Coordinator]()

	/// Current navigation controller.
	var navigationController: UINavigationController

	/// Start the current app coordinator.
	func start() {
		navigationController.delegate = self
		navigationController.navigationBar.prefersLargeTitles = true

		// Configure MoyaProvider.
		let provider = MoyaProvider<Aircall>(
			plugins: [NetworkLoggerPlugin(verbose: true)]
		)

		// Configure JSONDecoder
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		let child = CallListCoordinator(
			navigationController: navigationController,
			managedObjectContext: managedObjectContext,
			managedObjectModel: managedObjectModel,
			provider: provider,
			decoder: decoder
		)
		child.parentCoordinator = self
		childCoordinators.append(child)
		child.start()
	}

	// MARK: - CoreData stack

	/// CoreData managed object context.
	var managedObjectContext: NSManagedObjectContext

	/// CoreData managed object model.
	var managedObjectModel: NSManagedObjectModel

	// MARK: - Initialization

	init(
		navigationController: UINavigationController,
		managedObjectContext: NSManagedObjectContext,
		managedObjectModel: NSManagedObjectModel
		) {
		self.navigationController = navigationController
		self.managedObjectContext = managedObjectContext
		self.managedObjectModel = managedObjectModel
	}

	func childDidFinish(_ child: Coordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
		print("💚 [Navigation] AppCoordinators contains \(childCoordinators.count) childs.")
	}

}

// MARK: - UINavigationControllerDelegate

extension AppCoordinator: UINavigationControllerDelegate {

	/**

	Called just before the navigation controller displays a view controller’s view and navigation item properties.

	- Parameters:
	  - navigationController: The navigation controller that is showing the view and properties of a view controller.
	  - viewController: The view controller whose view and navigation item properties are being shown.
	  - animated: true to animate the transition; otherwise, false.

	*/
	func navigationController(
	_ navigationController: UINavigationController,
	willShow viewController: UIViewController,
	animated: Bool
	) {
		switch viewController {
		case is CallListViewController:
			print("CallListViewController")
		default:
			print("Unknown view controller")
		}
	}

	/**

	Called just after the navigation controller displays a view controller’s view and navigation item properties.

	- Parameters:
	  - navigationController: The navigation controller that is showing the view and properties of a view controller.
	  - viewController: The view controller whose view and navigation item properties are being shown.
	  - animated: true to animate the transition; otherwise, false.

	*/
	func navigationController(
	_ navigationController: UINavigationController,
	didShow viewController: UIViewController,
	animated: Bool
	) {
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
			print("didShow from")
			return
		}
		if navigationController.viewControllers.contains(fromViewController) {
			return
		}
	}

}
