//
//  CDCall+CoreDataProperties.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import CoreData

extension CDCall: CallRepresentable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCall> {
        return NSFetchRequest<CDCall>(entityName: "CDCall")
    }

    @NSManaged public var created: NSDate
    @NSManaged public var from: String
    @NSManaged public var to: String
    @NSManaged public var id: Int32
    @NSManaged public var direction: String
    @NSManaged public var via: String
    @NSManaged public var isArchived: Bool
    @NSManaged public var type: String
    @NSManaged public var duration: Int32

		// MARK: - Computed properties

    var createdAt: String {
			return ACDate.shared.string(from: created as Date)
		}

		var dateShort: String {
			return ACDate.shared.shortString(from: created as Date)
		}

		var dayString: String {
			return ACDate.shared.dayString(from: created as Date)
		}

}

extension CDCall: Comparable {
	public static func < (lhs: CDCall, rhs: CDCall) -> Bool {
		return lhs.dateShort < rhs.dateShort
	}
}
