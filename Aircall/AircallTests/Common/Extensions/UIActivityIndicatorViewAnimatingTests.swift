//
//  UIActivityIndicatorViewAnimatingTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class UIActivityIndicatorViewAnimatingTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `UIActivityIndicatorView` animating method.
	func testRefreshing() {
		let activityIndicatorView = UIActivityIndicatorView(frame: CGRect.zero)
		XCTAssertEqual(activityIndicatorView.isAnimating, false)
		activityIndicatorView.animating(true)
		XCTAssertEqual(activityIndicatorView.isAnimating, true)
		activityIndicatorView.animating(false)
		XCTAssertEqual(activityIndicatorView.isAnimating, false)
	}

}
