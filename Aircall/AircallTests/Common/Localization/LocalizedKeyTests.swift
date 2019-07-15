//
//  LocalizedKeyTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class LocalizedKeyTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `LocalizedKeyTests` cases.
	func testCases() {
		XCTAssertEqual(LocalizedKey.allCases.count, 12)
		XCTAssertTrue(LocalizedKey.allCases.contains(.title))
		XCTAssertTrue(LocalizedKey.allCases.contains(.missed))
		XCTAssertTrue(LocalizedKey.allCases.contains(.voicemail))
		XCTAssertTrue(LocalizedKey.allCases.contains(.refreshControl))
		XCTAssertTrue(LocalizedKey.allCases.contains(.all))
		XCTAssertTrue(LocalizedKey.allCases.contains(.archived))
		XCTAssertTrue(LocalizedKey.allCases.contains(.unarchived))
		XCTAssertTrue(LocalizedKey.allCases.contains(.businessError))
		XCTAssertTrue(LocalizedKey.allCases.contains(.mappingError))
		XCTAssertTrue(LocalizedKey.allCases.contains(.serverError))
		XCTAssertTrue(LocalizedKey.allCases.contains(.networkError))
		XCTAssertTrue(LocalizedKey.allCases.contains(.unknownError))
	}

}
