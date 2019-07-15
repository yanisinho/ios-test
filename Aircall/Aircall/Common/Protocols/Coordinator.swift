//
//  Coordinator.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

/**

	Describes an item which can be used as `Coordinator` item.

	Please read [Coordinator](https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps).
	This explains what is a Coordinator design pattern.

*/
protocol Coordinator: AnyObject {

	/// An array of coordinators that are children of the current coordinator.
	var childCoordinators: [Coordinator] { get set }

	/// Current navigation controller.
	var navigationController: UINavigationController { get set }

	/// Start the current coordinator.
	func start()

}
