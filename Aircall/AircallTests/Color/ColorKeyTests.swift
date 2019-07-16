//
//  ColorKeyTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class ColorKeyTests: XCTestCase {

	/// Test `ColorNameTests` cases.
	func testCases() {
		XCTAssertEqual(ColorKey.allCases.count, 5)
		XCTAssertTrue(ColorKey.allCases.contains(.primary))
		XCTAssertTrue(ColorKey.allCases.contains(.secondary))
		XCTAssertTrue(ColorKey.allCases.contains(.title))
		XCTAssertTrue(ColorKey.allCases.contains(.subtitle))
		XCTAssertTrue(ColorKey.allCases.contains(.background))
	}

	/// Test `ColorNameTests` colors.
	func testColors() {
		XCTAssertEqual(ColorKey.primary.color, UIColor(named: "primary")!)
		XCTAssertEqual(ColorKey.secondary.color, UIColor(named: "secondary")!)
		XCTAssertEqual(ColorKey.title.color, UIColor(named: "title")!)
		XCTAssertEqual(ColorKey.subtitle.color, UIColor(named: "subtitle")!)
		XCTAssertEqual(ColorKey.background.color, UIColor(named: "background")!)
	}

}
