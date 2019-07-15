//
//  ColorNameTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class ColorNameTests: XCTestCase {

	/// Test `ColorNameTests` cases.
	func testCases() {
		XCTAssertEqual(ColorName.allCases.count, 5)
		XCTAssertTrue(ColorName.allCases.contains(.primary))
		XCTAssertTrue(ColorName.allCases.contains(.secondary))
		XCTAssertTrue(ColorName.allCases.contains(.title))
		XCTAssertTrue(ColorName.allCases.contains(.subtitle))
		XCTAssertTrue(ColorName.allCases.contains(.background))
	}

	/// Test `ColorNameTests` colors.
	func testColors() {
		XCTAssertEqual(ColorName.primary.color, UIColor(named: "primary")!)
		XCTAssertEqual(ColorName.secondary.color, UIColor(named: "secondary")!)
		XCTAssertEqual(ColorName.title.color, UIColor(named: "title")!)
		XCTAssertEqual(ColorName.subtitle.color, UIColor(named: "subtitle")!)
		XCTAssertEqual(ColorName.background.color, UIColor(named: "background")!)
	}

}
