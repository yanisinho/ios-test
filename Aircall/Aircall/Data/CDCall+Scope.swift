//
//  CDCall+Scope.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

extension CDCall {

	/// Scope keys available for `CDCall` entities.
	public enum Scope: Int, CaseIterable {

		/// All `CDCall` entities.
		case all

		/// All `CDCall` entities with isArchived property set to true.
		case archived

		/// All `CDCall` entities with isArchived property set to false.
		case unarchived

	}

}

// MARK: - Requestable

extension CDCall.Scope {

	/**

	`CDCall.Scope` non-failable custom initializer.

	Default scope when raw value provided is invalid.

	- Parameters:
		- raw: The scope raw value.

	- Returns: `CDCall.Scope` instance.

	*/
	init(raw: Int) {
		self = CDCall.Scope(rawValue: raw) ?? .all
	}

	/// Scope title.
	var title: String {
		switch self {
		case .all:
			return LocalizedString.all
		case .archived:
			return LocalizedString.archived
		case .unarchived:
			return LocalizedString.unarchived
		}
	}

	/// Scope key.
	var key: String {
		switch self {
		case .all:
			return "all"
		case .archived:
			return "archived"
		case .unarchived:
			return "unarchived"
		}
	}

	/// Scope titles.
	static var titles: [String] {
		return CDCall.Scope.allCases.map {
			$0.title
		}
	}

}
