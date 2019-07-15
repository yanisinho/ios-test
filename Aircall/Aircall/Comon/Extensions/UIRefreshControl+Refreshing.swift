//
//  UIRefreshControl+Refreshing.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

extension UIRefreshControl {

	/// `UIRefreshControl` refreshing sugar synthax.
	func refreshing(_ value: Bool) {
		if value {
			beginRefreshing()
		} else {
			endRefreshing()
		}
	}

}
