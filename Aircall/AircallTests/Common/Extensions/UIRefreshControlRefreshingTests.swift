//
//  UIRefreshControlRefreshingTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class UIRefreshControlRefreshingTests: XCTestCase {

	/// Test `UIRefreshControl` refreshing method.
	func testRefreshing() {
		let refreshControl = UIRefreshControl(frame: CGRect.zero)
		XCTAssertEqual(refreshControl.isRefreshing, false)
		refreshControl.refreshing(true)
		XCTAssertEqual(refreshControl.isRefreshing, true)
		refreshControl.refreshing(false)
		XCTAssertEqual(refreshControl.isRefreshing, false)
	}

}
