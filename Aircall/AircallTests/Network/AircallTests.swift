//
//  AircallTests.swift
//  AircallTests
//
//  Created by Yanis SIDAHMED on 15/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import XCTest
import Moya
@testable import Aircall

class AircallTests: XCTestCase {

	static var provider: MoyaProvider<Aircall>!
	static var decoder: JSONDecoder!

	override class func setUp() {
		provider = MoyaProvider<Aircall>(
			stubClosure: MoyaProvider<Aircall>.immediatelyStub
		)
		decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		decoder.keyDecodingStrategy = .convertFromSnakeCase
	}

	/// Test getCalls endpoint.
	func testGetCalls() {
		AircallTests.provider.request(.getCalls) { (response) in
			switch response.result {
			case .success(let value):
				let data = try? AircallTests.decoder.decode(
					WSCalls.self,
					from: value.data
				)
				XCTAssertNotNil(data)
				XCTAssertEqual(data!.calls.count, 6)
			default:
				break
			}
		}
	}

	/// Test resetCalls endpoint.
	func testResetCalls() {
		AircallTests.provider.request(.resetCalls) { (response) in
			switch response.result {
			case .success(let value):
				let data = try? AircallTests.decoder.decode(
					WSReset.self,
					from: value.data
				)
				XCTAssertNotNil(data)
				XCTAssertEqual(data!.message, "done")
			default:
				break
			}
		}
	}

	/// Test getCall endpoint.
	func testGetCall() {
		AircallTests.provider.request(.getCall(callId: 7833)) { (response) in
			switch response.result {
			case .success(let value):
				let data = try? AircallTests.decoder.decode(
					WSCall.self,
					from: value.data
				)
				XCTAssertNotNil(data)
				XCTAssertEqual(data!.id, 7833)
				XCTAssertEqual(data!.createdAt, "16:59 PM")
				XCTAssertEqual(data!.callDirection, CallDirection.outbound)
				XCTAssertEqual(data!.direction, "outbound")
				XCTAssertEqual(data!.from, "Jonathan Anguelov")
				XCTAssertEqual(data!.to, "06 45 13 53 91")
				XCTAssertEqual(data!.via, "NYC Office")
				XCTAssertEqual(data!.duration, 60)
				XCTAssertEqual(data!.isArchived, false)
				XCTAssertEqual(data!.callType, .missed)
				XCTAssertEqual(data!.type, "missed")
			default:
				break
			}
		}
	}

	/// Test archiveCall endpoint.
	func testArchiveCall() {
		AircallTests.provider.request(.archiveCall(callId: 7833)) { (response) in
			switch response.result {
			case .success(let value):
				let data = try? AircallTests.decoder.decode(
					WSCall.self,
					from: value.data
				)
				XCTAssertNotNil(data)
				XCTAssertEqual(data!.id, 7833)
				XCTAssertEqual(data!.createdAt, "16:59 PM")
				XCTAssertEqual(data!.callDirection, CallDirection.outbound)
				XCTAssertEqual(data!.direction, "outbound")
				XCTAssertEqual(data!.from, "Jonathan Anguelov")
				XCTAssertEqual(data!.to, "06 45 13 53 91")
				XCTAssertEqual(data!.via, "NYC Office")
				XCTAssertEqual(data!.duration, 60)
				XCTAssertEqual(data!.isArchived, true)
				XCTAssertEqual(data!.callType, .missed)
				XCTAssertEqual(data!.type, "missed")
			default:
				break
			}
		}
	}

}
