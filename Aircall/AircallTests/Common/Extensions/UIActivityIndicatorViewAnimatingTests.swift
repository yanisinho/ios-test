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
