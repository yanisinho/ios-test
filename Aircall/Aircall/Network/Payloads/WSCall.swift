//
//  WSCall.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/**

Payload data sent back from `activitiyView` and `activityArchive` endpoints.

- Note:
For more informations, please visit the [official documentation](https://github.com/aircall/ios-test)

*/
//swiftlint:disable identifier_name
struct WSCall: Codable, CallRepresentable {

	// MARK: - Stored properties

	/// Unique ID of call.
	var id: Int

	/// Caller's number.
	var from: String

	/// Callee's number.
	var to: String

	/// Aircall number used for the call.
	var via: String

	/// Call archiving status
	let isArchived: Bool

	/// Duration of the call
	var duration: Int

	/// Creation date.
	var created: Date

	/// Call type.
	let callType: CallType

	/// Call direction.
	var callDirection: CallDirection

	/// Custom initializer.
	init(
		id: Int,
		from: String,
		to: String,
		via: String,
		isArchived: Bool,
		duration: Int,
		created: Date,
		callType: CallType,
		callDirection: CallDirection
		) {
		self.id = id
		self.from = from
		self.to = to
		self.via = via
		self.isArchived = isArchived
		self.duration = duration
		self.created = created
		self.callType = callType
		self.callDirection = callDirection
	}

	// MARK: - Computed properties

	/// Call type.
	var type: String {
		return callType.rawValue
	}

	/// Call direction.
	var direction: String {
		return callDirection.rawValue
	}

	/// Creation date.
	var createdAt: String {
		return ACDate.shared.string(from: created)
	}

	/// Custom coding keys.
	enum CodingKeys: String, CodingKey {
		case id
		case from
		case to
		case via
		case isArchived
		case duration
		case created = "createdAt"
		case callDirection = "direction"
		case callType
	}

	/**

	Creates a new instance by decoding from the given decoder.

	This initializer throws an error if reading from the decoder fails,
	or if the data read is corrupted or otherwise invalid.

	- Parameters:
	  - decoder: The decoder to read data from.

	*/
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		id = try container.decode(Int.self, forKey: .id)
		from = try container.decode(String.self, forKey: .from)
		to = (try? container.decode(String.self, forKey: .to)) ?? ""
		via = try container.decode(String.self, forKey: .via)
		isArchived = try container.decode(Bool.self, forKey: .isArchived)

		// Custom transformation because duration is supposed to be Int instead of String.
		let durationString = try container.decode(String.self, forKey: .duration)
		duration = Int(durationString) ?? 0

		// Custom transformation because date is supposed to be ISO8601 formatted.
		let createdAtString = try container.decode(String.self, forKey: .created)
		created = ACDate.shared.date(from: createdAtString)

		// Custom transformation to match CallType enum.
		let callTypeString = try container.decode(String.self, forKey: .callType)
		callType = CallType(rawValue: callTypeString) ?? CallType.unknown

		// Custom transformation to match CallDirection enum.
		let callDirectionString = try container.decode(String.self, forKey: .callDirection)
		callDirection = CallDirection(rawValue: callDirectionString) ?? CallDirection.unknown

	}

}
//swiftlint:enable identifier_name
