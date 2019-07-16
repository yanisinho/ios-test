//
//  LocalizedStringTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class LocalizedStringTests: XCTestCase {

	/// Test `LocalizedTests` colors.
	func testValues() {
		XCTAssertEqual(LocalizedString.title, LocalizedKey.title.value)
		XCTAssertEqual(LocalizedString.missed, LocalizedKey.missed.value)
		XCTAssertEqual(LocalizedString.voicemail, LocalizedKey.voicemail.value)
		XCTAssertEqual(LocalizedString.refreshControl, LocalizedKey.refreshControl.value)
		XCTAssertEqual(LocalizedString.all, LocalizedKey.all.value)
		XCTAssertEqual(LocalizedString.archived, LocalizedKey.archived.value)
		XCTAssertEqual(LocalizedString.unarchived, LocalizedKey.unarchived.value)
		XCTAssertEqual(LocalizedString.networkError, LocalizedKey.networkError.value)
		XCTAssertEqual(LocalizedString.serverError, LocalizedKey.serverError.value)
		XCTAssertEqual(LocalizedString.businessError, LocalizedKey.businessError.value)
		XCTAssertEqual(LocalizedString.mappingError, LocalizedKey.mappingError.value)
		XCTAssertEqual(LocalizedString.unknownError, LocalizedKey.unknownError.value)

	}

}
