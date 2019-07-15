//
//  ACDate.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/// Structure holding business logic related to date formatting.
struct ACDate {

	/// Singleton.
	static let shared = ACDate()

	/// Date formatter.
	private let formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		return formatter
	}()

	/// Private initializer.
	init() {

	}

	// MARK: - Public

	/**

		Build Date from String.

		- Parameters:
		  - string: The string to convert

		- Returns: Date object.

	*/
	func date(from string: String) -> Date {
		formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
		return formatter.date(from: string)!
	}

	/**

	Build String from Date.

	- Parameters:
	  - date: The date to convert

	- Returns: String representing the Date.

	*/
	func string(from date: Date) -> String {
		formatter.dateFormat = "HH:mm a"
		return formatter.string(from: date)
	}

	/**

	Build short String from Date.

	- Parameters:
	  - date: The date to convert

	- Returns: String representing the Date.

	*/
	func shortString(from date: Date) -> String {
		formatter.dateFormat = "yyyy/MM/dd"
		return formatter.string(from: date)
	}

	/**

	Build day String from Date.

	- Parameters:
	  - date: The date to convert

	- Returns: String representing the Date.

	*/
	func dayString(from date: Date) -> String {
		formatter.dateFormat = "EEEE d MMMM yyyy"
		return formatter.string(from: date)
	}

}
