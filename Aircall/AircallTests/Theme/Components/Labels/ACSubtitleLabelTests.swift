//
//  ACSubtitleLabelTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class ACSubtitleLabelTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `ACSubtitleLabel` text color.
	func testTextColor() {
		let label = ACSubtitleLabel(frame: CGRect.zero)
		XCTAssertEqual(label.textColor, Color.subtitle)
	}

}
