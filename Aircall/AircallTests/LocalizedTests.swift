//
//  LocalizedTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class LocalizedTests: XCTestCase {

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test `LocalizedTests` colors.
	func testValues() {
		XCTAssertEqual(Localized.title, LocalizedKey.title.value)
		XCTAssertEqual(Localized.missed, LocalizedKey.missed.value)
		XCTAssertEqual(Localized.voicemail, LocalizedKey.voicemail.value)
		XCTAssertEqual(Localized.refreshControl, LocalizedKey.refreshControl.value)
		XCTAssertEqual(Localized.all, LocalizedKey.all.value)
		XCTAssertEqual(Localized.archived, LocalizedKey.archived.value)
		XCTAssertEqual(Localized.unarchived, LocalizedKey.unarchived.value)
		XCTAssertEqual(Localized.networkError, LocalizedKey.networkError.value)
		XCTAssertEqual(Localized.serverError, LocalizedKey.serverError.value)
		XCTAssertEqual(Localized.businessError, LocalizedKey.businessError.value)
		XCTAssertEqual(Localized.mappingError, LocalizedKey.mappingError.value)
		XCTAssertEqual(Localized.unknownError, LocalizedKey.unknownError.value)

	}

}
