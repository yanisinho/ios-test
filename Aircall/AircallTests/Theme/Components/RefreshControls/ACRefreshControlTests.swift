//
//  ACRefreshControlTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

//swiftlint:disable force_cast
class ACRefreshControlTests: XCTestCase {

	static var refresh: ACRefreshControl!
	static var attributes: [NSAttributedString.Key: Any]!

	override class func setUp() {
		refresh = ACRefreshControl(frame: CGRect.zero)
		attributes = refresh.attributedTitle?.attributes(
			at: 0,
			longestEffectiveRange:
			nil,
			in: NSRange(location: 0, length: 1)
		)
	}
	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `ACRefreshControl` colors.
	func testColors() {
		XCTAssertEqual(
			ACRefreshControlTests.refresh.tintColor,
			Color.secondary
		)
		XCTAssertEqual(
			ACRefreshControlTests.attributes[.foregroundColor] as! UIColor,
			Color.secondary
		)
	}

	/// Test `ACRefreshControl` text.
	func testTextAttributes() {
		XCTAssertEqual(
			ACRefreshControlTests.refresh.attributedTitle?.string,
			"title"
		)
		XCTAssertEqual(
			ACRefreshControlTests.attributes[.font] as! UIFont,
			UIFont.preferredFont(forTextStyle: .headline)
		)
	}

}
//swiftlint:enable force_cast
