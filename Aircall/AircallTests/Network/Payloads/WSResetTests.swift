//
//  WSResetTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class WSResetTests: XCTestCase {

	/// Test `WSReset` initializer.
	func testInit() {
		let reset = WSReset(message: "failed")
		XCTAssertEqual(reset.message, "failed")
	}

}
