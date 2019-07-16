//
//  CDCall+CoreDataProperties.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import CoreData

//swiftlint:disable identifier_name
extension CDCall: CallRepresentable {

	/// `NSFetchRequest` retreiving all `CDCall` objects from the data store.
	@nonobjc public class func fetchRequest() -> NSFetchRequest<CDCall> {
		return NSFetchRequest<CDCall>(entityName: "CDCall")
	}

	/// Unique ID of call.
	@NSManaged public var id: Int32

	@NSManaged public var created: NSDate

	/// Caller's number.
	@NSManaged public var from: String

	/// Callee's number.
	@NSManaged public var to: String

	/// Aircall number used for the call.
	@NSManaged public var via: String

	/// Call direction.
	@NSManaged public var direction: String

	/// Call type.
	@NSManaged public var type: String

	/// Call duration in seconds.
	@NSManaged public var duration: Int32

	/// Call archiving status.
	@NSManaged public var isArchived: Bool

	// MARK: - Computed properties

	/// String representation of `createdAt` property.
	var createdAt: String {
		return ACDate.shared.string(from: created as Date)
	}

	/// String representation of the day. (Ordering base).
	var dateShort: String {
		return ACDate.shared.shortString(from: created as Date)
	}

	/// String representation of the day.
	var dayString: String {
		return ACDate.shared.dayString(from: created as Date)
	}

}

extension CDCall: Comparable {

	/// Order `CDCall` entities based on `dateShort` property.
	public static func < (lhs: CDCall, rhs: CDCall) -> Bool {
		return lhs.dateShort < rhs.dateShort
	}

}
//swiftlint:enable identifier_name
