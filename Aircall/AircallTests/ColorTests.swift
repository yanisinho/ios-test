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

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `ColorTests` colors.
	func testColors() {
		XCTAssertEqual(Color.primary, UIColor(named: "primary")!)
		XCTAssertEqual(Color.secondary, UIColor(named: "secondary")!)
		XCTAssertEqual(Color.title, UIColor(named: "title")!)
		XCTAssertEqual(Color.subtitle, UIColor(named: "subtitle")!)
		XCTAssertEqual(Color.background, UIColor(named: "background")!)
	}

}

