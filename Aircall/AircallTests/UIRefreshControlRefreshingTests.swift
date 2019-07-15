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

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

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
