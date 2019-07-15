//
//  AircallErrorTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class AircallErrorTests: XCTestCase {

	/// Test `AircallError` cases count.
	func testCount() {
		XCTAssertEqual(AircallError.allCases.count, 1)
	}

}
