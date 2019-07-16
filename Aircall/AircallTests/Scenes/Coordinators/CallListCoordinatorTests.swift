//
//  CallListCoordinatorTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
import Moya
import CoreData
@testable import Aircall

class CallListCoordinatorTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `CallDetailsCoordinator` initializer.
	func testInit() {

		// Create dummy view controllers.
		let firstViewController = UIViewController()
		let secondViewController = UIViewController()
		let thirdViewController = UIViewController()

		// Create dummy navigation controller.
		let navigationController = UINavigationController()
		navigationController.pushViewController(firstViewController, animated: false)
		navigationController.pushViewController(secondViewController, animated: false)
		navigationController.pushViewController(thirdViewController, animated: false)

		// Create dummy managed object context.
		let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!

		// Create persistent store coordinator.
		let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
		do {
			try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
		} catch {
			print("Adding in-memory persistent store failed")
		}

		// Create dummy managed object model.
		let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
		managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator

		// Create dummy moya provider.
		let provider: MoyaProvider = MoyaProvider<Aircall>()

		// Create dummy json decoder.
		let decoder: JSONDecoder = JSONDecoder()
		decoder.dataDecodingStrategy = .base64
		decoder.dateDecodingStrategy = .iso8601
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		// Create dummy coordinator
		let coordinator = CallListCoordinator(
			navigationController: navigationController,
			managedObjectContext: managedObjectContext,
			managedObjectModel: managedObjectModel,
			provider: provider,
			decoder: decoder
		)

		XCTAssertEqual(coordinator.navigationController.children.count, 3)
	}

}
