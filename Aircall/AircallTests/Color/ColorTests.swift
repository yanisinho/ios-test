//
//  ColorTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class ColorTests: XCTestCase {

	/// Test `ColorTests` colors.
	func testColors() {
		XCTAssertEqual(Color.primary, UIColor(named: "primary")!)
		XCTAssertEqual(Color.secondary, UIColor(named: "secondary")!)
		XCTAssertEqual(Color.title, UIColor(named: "title")!)
		XCTAssertEqual(Color.subtitle, UIColor(named: "subtitle")!)
		XCTAssertEqual(Color.background, UIColor(named: "background")!)
	}

}
