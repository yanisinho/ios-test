//
//  ConfiguratorTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
@testable import Aircall

class ConfiguratorTests: XCTestCase {

	/// Sample displayable
	class DummyDisplayable: CallDisplayable {
		var typeImageView: UIImageView
		var fromLabel: ACTitleLabel
		var toLabel: ACSubtitleLabel
		var createAtLabel: ACSubtitleLabel

		init(
			type: UIImageView = UIImageView(frame: CGRect.zero),
			from: ACTitleLabel = ACTitleLabel(frame: CGRect.zero),
			to: ACSubtitleLabel = ACSubtitleLabel(frame: CGRect.zero),
			createAt: ACSubtitleLabel = ACSubtitleLabel(frame: CGRect.zero)
			) {
			self.typeImageView = type
			self.fromLabel = from
			self.toLabel = to
			self.createAtLabel = createAt
		}
	}

	/// Sample representable
	struct DummyRepresentable: CallRepresentable {
		let from: String
		let to: String
		let type: String
		let createdAt: String
	}

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	/// Test update method.
	func testUpdate() {
		let displayable = DummyDisplayable()
		let representable = DummyRepresentable(
			from: "Aircall",
			to: "Yanis",
			type: "answered",
			createdAt: "08:31 AM"
		)
		Configurator.update(
			displayable,
			with: representable
		)
		XCTAssertEqual(
			displayable.fromLabel.text,
			"Aircall"
		)
		XCTAssertEqual(
			displayable.toLabel.text,
			"Yanis"
		)
		XCTAssertEqual(
			displayable.createAtLabel.text,
			"08:31 AM"
		)

	}

}
